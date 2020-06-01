# Encryption
(Based on http://forums.linuxmint.com/viewtopic.php?f=197&t=71159)

 ## Initial preparations

Reboot in LiveCD

Root shell:

```
sudo -s
```

Install nessesery packages (?)

```
apt-get update
apt-get install lvm2 cryptsetup
```

 ## Partitioning

Create partitions, for ex.

	/dev/sda1     256M     ext2     /boot
	/dev/sda2     100G              LVM
	/dev/sda3     100G     NTFS     Windows
	/dev/sda4     200G     NTFS     DATA

Optional erase

	dd if=/dev/zero of=/dev/sda1 bs=1M
	dd if=/dev/urandom of=/dev/sda2 bs=1M & sleep 5; while kill -USR1 ${!}; do sleep 60; done

 ## Logical Volume Manager

Create and open LUKS on `/dev/sda2`

	cryptsetup luksFormat /dev/sda2
	cryptsetup luksOpen /dev/sda2 sda2_crypt
	VOLUME=/dev/mapper/sda2_crypt

Create physical volume

	pvcreate $VOLUME

Create volume group named 'volumes'

	vgcreate volumes $VOLUME

Create logical volumes

	lvcreate -n swap -L 16G volumes
	lvcreate -n mint -L 500G volumes

If there is insufficient space you will get a message like the following: "Volume group "volumes" has insufficient free space (9984 extents): 12800 required." Just rerun the command replacing the -L option with -l (lower-case L) and the number in the parenthesis (9984 in this case).

	lvcreate -n mint -l 9984 volumes

 ## Install Linux

Format mint partition and setup mounting points from installer, install Linux and reboot in LiveCD.

Open LUKS

	cryptsetup luksOpen /dev/sda2 sda2_crypt

Check /mnt/etc/fstab

Edit  /mnt/etc/crypttab

	sda2_crypt      /dev/sda2       none    luks

Replace with UIDs (/dev/by_uid) if not working.

If you make any changes to /etc/crypttab after installing cryptsetup, you will need to run:

	update-initramfs -u

to update the initial ramdisk image. To do this you must chroot to installed system when in LiveCD:

	# cp /etc/resolv.conf /mnt/etc/ ???
	mount --bind /dev /mnt/dev
	chroot /mnt
	mount -t sysfs none /sys
	mount -t proc none /proc
	mount -t devpts none /dev/pts
	update-initramfs -u



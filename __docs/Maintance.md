Packages
================================================================================

Query
-----

- List exclipit installed w/o deps `-Qet` Query explicit unrequired
- List orphans `-Qdt` Query dependencies unrequired
- List foreign (AUR, etc.) packages `-Qm` Query foreign
- List native packages `-Qn` Query native

Manage
------

### Update all
	sudo pacman -Syu

### Remove orphans
	sudo pacman -Rns $(pacman -Qtdq)

### Clear cache
	yay -Sc

Disks
================================================================================

Checkdisk
---------

`fsck /dev/sda1`


SMART
-----

- Test: `smartctl -t short /dev/sda`
- Wyniki testu: `smartctl -l selftest /dev/sdb`

Filesystem
================================================================================

Mounting
--------

### CIFS mount

```fstab
//192.168.1.1/t_drive	/mnt/t-drive	cifs	noauto,x-systemd.automount,x-systemd.mount-timeout=30,_netdev,uid=1000,gid=1000	0	0
```

### Systemd automount

Changing `/etc/fstab` entries with x-systemd requires restart some shit:

```sh
sudo systemctl daemon-reload
sudo systemctl restat local-fs.target
sudo systemctl restat remote-fs.target
```

Default system permissions
--------------------------

Be very, very careful when using this:

```sh
find . -type d -print0 | xargs -0 chmod 0755
find . -type f -print0 | xargs -0 chmod 0644
```

Network
================================================================================

![](img/IPMan.vs.TheMask.jpg)

Connect WiFi
	sudo wpa_supplicant -B -i wlp62s0 -c /etc/wpa_supplicant/wpa_supplicant-wlp62s0.conf

Clear DNS cache
	sudo systemctl restart ???

Xorg
================================================================================

Reload Xresources
-----------------
	xrdb ~/.Xresources

Keyboard
================================================================================

Rate
	xset r rate 250 35

Reload xmodmap `xmodmap ~/.Xmodmap`

Reload xbindkeys
  xbindkeys --poll-rc

Audio
================================================================================

![](img/cats-keyboard.gif)

> Restart PulseAudio server
	pulseaudio -k && pulseaudio -D

XGD MIME
================================================================================

Update file associacions
------------------------
Set in:
	~/.config/mimeapps.list
Reload:
	update-desktop-database ~/.local/share/applications/

Update new MIME types
---------------------

Add `.desktop` files to:
	~/.local/share/mime/applications
Reload:
	update-mime-database .local/share/mime/

![](img/working-cat.gif)


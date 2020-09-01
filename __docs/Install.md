Installation
================================================================================
https://wiki.archlinux.org/index.php/Installation_guide
https://wiki.archlinux.org/index.php/General_recommendations

After install
================================================================================

Boot params
-----------
- modprobe.blacklist=nouveau,iTCO_wdt - disable buggy nouveau driver and watchdog module
- i915.enable_guc=2 - ???
- pci=nommconf - disables wlan AER bugs spamming, OR
- pcie_aspm=off  - for buggy aspm implementation
- nowatchdog - disables both soft and hard watchdogs

Packages
--------
- sudo, fish, vim, git, stow, terminus-font

Virtual console
---------------
/etc/vconsole.conf
	KEYMAP=pl
	FONT=ter-220b

Network
-------
- networkmanager - required for WiFi
- crda - some wifi crap, to shut up warnings in dmesg

`sudo systemctl enable NetworkManager.service`

Time sync
---------
```sh
sudo systemctl enable systemd-timesyncd.service
sudo systemctl start systemd-timesyncd.service
```

Xorg
================================================================================

Install
-------
- xrandr
- xbindkeys
- compton


Apperance
================================================================================

- adapta-gtk-theme - set in ~/.config/gtk-3.0/settings.ini
- adapta-kde ?
- ttf-ubuntu-font-family

Audio
================================================================================

Required
--------

- pulseaudio - audio server - required for everything
- pavucontrol - GTK mixer
- playerctl - controling media players, for media buttons to work

Optional
--------

- pulseeffects - equalizer, crystalizer and lot more

Bluetooth
================================================================================

- blueman - GTK bluetooth manager
- bluez-utilz - `bluetoothctl` app (optional)
- pulseaudio-bluetooth - PA integration with bluetooth, restart PA after install
- enable/start `bluetooth.service`

Terminal
================================================================================

- Alacritty

Vifm
----
- vifm
- highlight, xclip, mp3info
- sshfs, curlftpfs, archivemount(AUR), fuse-zip(AUR)
- sxiv
- trash-cli
- zathura-pdf-poppler

Power
================================================================================

Hibernate
---------

[](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Hibernation)

`fallocate` dind't work on ext4 use `dd` instead

```sh
sudo dd if=/dev/zero of=/swapfile bs=1G count=8 status=progress
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

In `/etc/fstab`:
```
/swapfile none swap defaults 0 0
```

Use
```sh
filefrag -v /swapfile | awk '{ if($1=="0:"){print $4} }'
```
to find _swap_offset_.

In `/boot/loader/entries/arch.conf` add kernel options
- `resume=UUID=xxx...` UUID of swap partition or device containing swap file
- `resume_offset=swap_offset` for swap file only

In `/etc/mkinitcpio.conf` in `HOOKS` add `resume` after `udev`, for example:
```
HOOKS=(base udev autodetect modconf block filesystems keyboard resume fsck)
```

Regenerate initramfs with `sudo mkinitcpio -P`

Maybe decrease _swappiness_?

GUI
================================================================================

Wallpapers
	nitrogen

Opera
-----

- opera, opera-ffmpeg-codecs (video), chromium-widevine (netflix)
- mkdir /opt/google/chrome
- sudo ln -s /usr/lib/chromium/WidevineCdm/ /opt/google/chrome/

Printer
================================================================================

```sh
sudo systemctl enable org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service
```

Unity3D
================================================================================

C#
--
https://github.com/OmniSharp/omnisharp-roslyn/releases

Unity dependicies
-----------------
7zip cpio

Done
================================================================================
![done](img/monkey.gif)


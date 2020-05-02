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
```
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

GUI
================================================================================

Wallpapers
	nitrogen

Opera
-----

- opera, opera-ffmpeg-codecs (video), chromium-widevine (netflix)
- mkdir /opt/google/chrome
- sudo ln -s /usr/lib/chromium/WidevineCdm/ /opt/google/chrome/


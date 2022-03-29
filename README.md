# Arch installation
https://wiki.archlinux.org/index.php/Installation_guide

## Boot params
- modprobe.blacklist=nouveau,iTCO_wdt - disable buggy nouveau driver and watchdog module
- i915.enable_guc=2 - ???
- pci=nommconf - disables wlan AER bugs spamming, OR pcie_aspm=off - for buggy aspm implementation
- nvidia-drm.modeset=1
- nowatchdog - disables both soft and hard watchdogs


nVidia
================================================================================

```sh
watch -n 1 nvidia-smi
```

Wacom tablet
================================================================================

Drivers: xf86-input-wacom

Limit to screen
---------------

	xsetwacom set 14 MapToOutput DP-3
	xsetwacom set 14 MapToOutput HEAD-0

- `14` - id for type `STYLUS` in `xsetwacom list devices`
- `DP-3` - screen name from `xrandr`
- `HEAD-0` - 0,1,2 for nVidia


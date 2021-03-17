#!/bin/sh

    
# case "$(echo -e "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu \
case "$(echo -e "鈴 Suspend\n Reboot\n Poweroff" | run-rofi -dmenu -i -p " ")" in
        "鈴 Suspend") exec systemctl suspend;;
		# Hibernate) exec systemctl hibernate;;
        " Reboot") exec systemctl reboot;;
        " Poweroff") exec systemctl poweroff;;
        # Logout) kill -HUP $XDG_SESSION_PID;;
        # Lock) exec systemctl --user start lock.target;;
esac

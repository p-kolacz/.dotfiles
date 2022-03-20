#!/bin/sh

case "$(echo -e "鈴 Suspend\n Lock\n Reboot\n Poweroff" | $VMENU -i -p " ")" in
        "鈴 Suspend") exec systemctl suspend;;
		" Lock") exec slock ;;
        " Reboot") exec systemctl reboot;;
        " Poweroff") exec systemctl poweroff;;
		# Hibernate) exec systemctl hibernate;;
        # Logout) kill -HUP $XDG_SESSION_PID;;
esac


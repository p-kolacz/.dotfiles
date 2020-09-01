#!/bin/sh

    
# case "$(echo -e "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu \
case "$(echo -e "Suspend\nHibernate\nReboot\nPoweroff" | dmenu \
	-i -b -h 32 \
    -p " ")" in
        Suspend) exec systemctl suspend;;
		Hibernate) exec systemctl hibernate;;
        Reboot) exec systemctl reboot;;
        Poweroff) exec systemctl poweroff;;
        # Logout) kill -HUP $XDG_SESSION_PID;;
        # Lock) exec systemctl --user start lock.target;;
esac

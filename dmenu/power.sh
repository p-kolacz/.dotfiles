#!/bin/sh

    
# case "$(echo -e "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu \
case "$(echo -e "Suspend\nReboot\nShutdown" | dmenu \
	-i -b -h 32 -fn 'Ubuntu-12' \
    -p " ")" in
        Suspend) exec systemctl suspend;;
        Reboot) exec systemctl reboot;;
        Shutdown) exec systemctl poweroff;;
        # Logout) kill -HUP $XDG_SESSION_PID;;
        # Lock) exec systemctl --user start lock.target;;
esac

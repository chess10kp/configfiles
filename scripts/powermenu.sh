#!/usr/bin/sh

nothing='\uebc6'
shutdown=' Shutdown'
reboot=' Reboot'
suspend=' Suspend'
logout=' Logout'

POWER_STATE="${shutdown}\n${reboot}\n${logout}"
TIME=$(uptime|grep -o "[0-9][0-9]:[0-9][0-9]:[0-9][0-9]")
POWER_SELECTION=$(echo -e $POWER_STATE | fuzzel -d --background=11111DFF -p"Uptime: "$TIME -l4 )
echo $POWER_SELECTION
if [[ "$POWER_SELECTION" = $shutdown ]];then
        poweroff
fi
if [[ "$POWER_SELECTION" = $reboot ]];then
        reboot
fi
if [[ "$POWER_SELECTION" = $logout ]];then
        pkill -KILL -u $(whoami)
fi
if [[ "$POWER_SELECTION" = $suspend ]];then
        suspend
fi

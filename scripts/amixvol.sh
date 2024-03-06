
#!/usr/bin/env sh


# define functions

function print_error
{
cat << "EOF"
    ./volumecontrol.sh -[device] <action>
    ...valid device are...
        i -- [i]nput decive
        o -- [o]utput device
    ...valid actions are...
        i -- <i>ncrease volume [+5]
        d -- <d>ecrease volume [-5]
        m -- <m>ute [x]
EOF
}

function notify_vol
{
    vol=`amixer get Master | grep -o "[0-9]*%" | head -1`
    notify-send -a volume -r 91190 -t 800 "Volume: $vol"
}

function notify_mute
{
    mute=`amixer get Master | grep -o "\[off\]" | head -1 `
    if [ -n "$mute"  ] ; then
      notify-send -a volume -r 91190 -t 800 "Mute: false"
    else 
      notify-send -a volume -r 91190 -t 800 "Mute: true"
    fi
}


if [ $OPTIND -eq 1 ] ; then
    print_error
fi

case $1 in
    i) amixer set Master 5%+ 
        notify_vol ;;
    d) amixer set Master 5%- 
        notify_vol ;;
    m) amixer set Master toggle
        notify_mute ;;
    *) print_error ;;
esac


#!/usr/bin/env sh

# define functions


function notify-brightness
{
    vol=`pamixer $srce --get-volume | cat`
    angle="$(( (($vol+2)/5) * 5 ))"
    ico="${icodir}/vol-${angle}.svg"
    bar=$(seq -s "." $(($vol / 15)) | sed 's/[0-9]//g')
    dunstify -a "$vol$bar" "$nsink" -i $ico -r 91190 -t 800
}

function notify_mute
{
    mute=`pamixer $srce --get-mute | cat`
    if [ "$mute" == "true" ] ; then
        dunstify -a "muted" "$nsink" -i ${icodir}/muted-${dvce}.svg -r 91190 -t 800
    else
        dunstify -a "unmuted" "$nsink" -i ${icodir}/unmuted-${dvce}.svg -r 91190 -t 800
    fi
}


while getopts io SetSrc
do
    case $SetSrc in
    i) nsink=$(pamixer --list-sources | grep "_input." | head -1 | awk -F '" "' '{print $NF}' | sed 's/"//')
        srce="--default-source"
        dvce="mic" ;;
    o) nsink=$(pamixer --get-default-sink | grep "_output." | awk -F '" "' '{print $NF}' | sed 's/"//')
        srce=""
        dvce="speaker" ;;
    esac
done

if [ $OPTIND -eq 1 ] ; then
    print_error
fi


shift $((OPTIND -1))
step="${2:-5}"
icodir="~/.config/dunst/icons/vol"

case $1 in
    i) pamixer $srce -i ${step}
        notify_vol ;;
    d) pamixer $srce -d ${step}
        notify_vol ;;
    m) pamixer $srce -t
        notify_mute ;;
    *) print_error ;;
esac

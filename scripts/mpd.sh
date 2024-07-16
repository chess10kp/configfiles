source ~/.config/scripts/configvars.sh

music_dir="$HOME/Music"

songs=$(ls $music_dir)
songs+=$(printf "\n::pause::\n::play::\n::next::\n::repeat::\n::norepeat::\n::single::\n::nosingle::\n::clear::")

selected="$(echo "$songs" | $rofi_prompt 'Queue: '  )"

case "$selected" in
  "")
    notify-send "Music" "Aborted selection"
    exit 
    ;; 
  ::pause::) 
    mpc pause
  ;;
  ::play::) 
    mpc play
  ;;
  ::next::) 
    mpc next 
  ;; 
  ::nosingle::) 
    mpc single off 
    notify-send "Music" "single off"
    ;;
  ::single::) 
    mpc single on 
    notify-send "Music" "single on"
    ;;
  ::norepeat::) 
    mpc repeat off 
    notify-send "Music" "repeat off"
    ;;
  ::repeat::) 
    mpc repeat on 
    notify-send "Music" "repeat on"
    ;;
  ::clear::) 
    mpc clear 
    ;;
  *) 
  mpc add "$selected"
  notify-send "Music" "Playing $selected"
  mpc play
  ;;
esac

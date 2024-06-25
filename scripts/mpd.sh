source ~/.config/scripts/configvars.sh

music_dir="$HOME/Music"

songs=$(ls $music_dir)
songs+=$(printf "\n::pause::\n::play::\n::next::\n::repeat::\n::clear::")

selected="$(echo "$songs" | $rofi )"

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
  ::repeat::) 
    mpc repeat on 
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

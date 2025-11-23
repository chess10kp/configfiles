#!/bin/bash
source ~/.config/scripts/configvars.sh

music_dir="$HOME/Music"

if [ ! -d "$music_dir" ]; then
    notify-send "Music Error" "Music directory not found: $music_dir"
    exit 1
fi

# --- Function to manage the current queue (view and remove) ---
manage_queue() {
    while true; do
        queue_items=$(mpc playlist -f '[[%artist% - ]%title%]|%file%\t%position%')

        # Control commands for the queue menu
        queue_commands=$(echo -e "::back::\n::clear::")
        
        # Combine queue items and controls
        queue_menu_list=$(echo -e "$queue_items\n$queue_commands")

        # Prompt Rofi with the queue list
        local selected_queue_item="$(echo -e "$queue_menu_list" | $rofi_prompt 'Queue Manager: ' )"

        case "$selected_queue_item" in
            "")
                exit 0
                ;;
            ::back::)
                return
                ;;
            ::clear::)
                mpc clear
                notify-send "Music" "Queue cleared"
		exit 0
                ;;
            *)
                local position=$(echo "$selected_queue_item" | cut -f2 -d$'\t')
                local title=$(echo "$selected_queue_item" | cut -f1 -d$'\t')

                if [[ -n "$position" && "$position" =~ ^[0-9]+$ ]]; then
                    # mpc del uses 1-based index
                    mpc del "$position"
                    notify-send "Music" "Removed: $title"
                    # Loop continues, showing the updated queue
                else
                    notify-send "Music Error" "Invalid selection."
                fi
                ;;
        esac
    done
}
while true; do
    music_files=$(find "$music_dir" -type f \
        \( -iname '*.mp3' -o -iname '*.flac' -o -iname '*.opus' -o -iname '*.ogg' -o -iname '*.m4a' -o -iname '*.wav' \) \
        -printf "%f\t%P\n")
    echo $music_files

    songs=$(echo -e "$music_files\n::queue::\n::pause::\n::play::\n::next::\n::rescan::\n::repeat::\n::norepeat::\n::single::\n::nosingle::\n::clear::\n::quit::")

    selected="$(echo "$songs" | $rofi_prompt 'Queue: ' )"

    case "$selected" in
      "")
        notify-send "Music" "Music menu closed."
        break
        ;;
      ::quit::)
        notify-send "Music" "Music menu closed."
        break
        ;;
      ::queue::)
        manage_queue
        ;;
      ::rescan::)
        mpc rescan
        notifingle off
        notify-send "Music" "Single mode off"
        ;;
      ::single::)
        mpc single on
        notify-send "Music" "Single mode on"
        ;;
      ::norepeat::)
        mpc repeat off
        notify-send "Music" "Repeat mode off"
        ;;
      ::repeat::)
        mpc repeat on
        notify-send "Music" "Repeat mode on"
        ;;
      ::clear::)
        mpc clear
        notify-send "Music" "Queue cleared"
	exit 0 
        ;;
      *)
        # Song selection in the main menu
        file_path=$(echo "$selected" | cut -f2 -d$'\t')

        if [ -z "$file_path" ]; then
            notify-send "Music Error" "Invalid song selection."
            continue # Continue loop to show menu again
        fi

        mpc add "$file_path"
        mpc play
	exit 0
        ;;
    esac
done

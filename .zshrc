if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  export QT_AUTO_SCREEN_SCALE_FACTOR=1
  export QT_QPA_PLATFORMTHEME=qt5ct
  export QT_QPA_PLATFORM="wayland;xcb"
  export _JAVA_AWT_WM_NONREPARENTING=1
  export NO_AT_BRIDGE=1
  export GTK_USE_PORTAL=0
  export CLUTTER_BACKEND=wayland
  export SDL_VIDEODRIVER="wayland,x11"
  export SDL_AUDIODRIVE=pipewire
  export WLR_RENDERER=vulkan
  #export MESA_LOADER_DRIVER_OVERRIDE=zink
  export VDPAU_DRIVER=radeonsi
  export XDG_SESSION_TYPE=wayland
  export XKB_DEFAULT_LAYOUT=gb
  export XKB_DEFAULT_VARIANT=pc104
  export XDG_SESSION_DESKTOP=sway
  export XDG_CURRENT_DESKTOP=sway 
  dbus-run-session sway
fi

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000000
zstyle :compinstall filename '/home/nitin/.zshrc'

autoload -Uz compinit
compinit
# binds up and down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -v
bindkey -s "^T" 'tmux attach -t  $(tmux list-sessions | fzf | sed -e "s/:.*//"  )^M' >/dev/null 2>&1
bindkey '^R' history-incremental-search-backward
bindkey -s "^F" 'cdfzf^M'  
bindkey -s "^Y" 'nvimfzf^M' >/dev/null 2>&1

function cdfzf {
  cd ~/projects
  dir=$(find ./  -name node_modules -prune -o -name "*.git" -prune -o -name venv -prune -o  -type d   | fzf)
  [[ -n $dir ]] && cd $dir
}

function nvimfzf 
{
  [[ $(pwd) == $(eval echo ~) ]] && return
  nvim $(find ./ -name node_modules -prune -o -name venv -prune -o  -type f -maxdepth 3 | fzf)
}

function mkcir
{
  command mkdir $1 && cd $1
}

alias e="exit"
alias gst="git status"
alias c="clear"
alias sdi="paru -S"
alias sdr="sudo pacman -R"
alias sdu="sudo pacman -Syu"
alias fh="cat ~/.zsh_history | fzf | sh"
alias fe="find . \( ! -regex '.*/\..*' \) -type f | fzf | xargs nvim"
alias :q="exit"
alias :e="vim"
alias ta="tmux attach"
alias td="tmux detach"
alias mkdir="mkdir -p"
alias cp="cp -v"
alias mv="mv -i"
alias ls="ls --color"

function yt
{
    command yt-dlp -f 'ba' -x --audio-format mp3 "$1" -o '%(title)s.mp3'
}

export PATH="$HOME/.config/emacs/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.local/bin/flutter/bin/"
export EDITOR="nvim"
export PATH="$GOROOT/bin:$PATH"
export GOPATH="$HOME/golib"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/Android/Sdk/cmdline-tools/latest/bin:$PATH"
export ANDROID_HOME="$HOME/Android/Sdk/"
export GOPATH="$HOME/projects/go/:$GOPATH"
export QT_QPA_PLATFORMTHEME=qt5ct
export CHROME_EXECUTABLE=/usr/bin/chromium-browser

function tmux-run
{
    tmux attach -t  $(tmux list-sessions | fzf | sed -e 's/:.*//'  )
}

# source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/zsh-abbr/zsh-abbr.zsh

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# RPROMPT='$GITSTATUS_PROMPT'

# autoload -Uz vcs_info
# precmd() { vcs_info }

# zstyle ':vcs_info:git:*' formats '%b '

# setopt PROMPT_SUBST
# PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f> '
PROMPT='%F{blue}%~%f %F{red}%f'
# [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
# source /usr/share/nvm/bash_completion
# source /usr/share/nvm/install-nvm-exec
# eval "$(zoxide init zsh)"

[ -f "/home/sigma/.ghcup/env" ] && source "/home/sigma/.ghcup/env" # ghcup-env

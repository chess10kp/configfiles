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
  dbus-launch sway
fi

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000000
zstyle :compinstall filename '/home/nitin/.zshrc'
zstyle ':completion:*' fzf-search-display true

autoload -Uz compinit
compinit
# binds up and down
function cdfzf {
  cd ~/projects
  dir=$(find ./  -name node_modules -prune -o -name "*.git" -prune -o -name venv -prune -o  -type d   | fzf)
  [[ -n $dir ]] && cd $dir }

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
alias ff="cdfzf"
alias gss="git status"
alias gsl="git status | vim -"
alias c="clear"
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
alias mpic="mpv --loop=inf"
alias convas="cd ~/projects/repos/convas; ./src/convas.py"

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

if [[ -d "$HOME/.cargo/bin" ]]; then
 export PATH="$PATH:$HOME/.cargo/bin/cargo" 
fi
export EDITOR="nvim"
export PATH="$GOROOT/bin:$PATH"
export GOPATH="$HOME/golib"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/Android/Sdk/cmdline-tools/latest/bin:$PATH"
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export GOPATH="$HOME/projects/go/:$GOPATH"
export QT_QPA_PLATFORMTHEME=qt5ct
export CHROME_EXECUTABLE=/usr/bin/chromium-browser

function tmux-run
{
    tmux attach -t  $(tmux list-sessions | fzf | sed -e 's/:.*//'  )
}

# source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
# source ~/.config/zsh/zsh-abbr/zsh-abbr.zsh
source ~/.config/zsh/fzf-tab/fzf-tab.zsh

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
RPROMPT='%F{green}%~%f'

# autoload -Uz vcs_info
# precmd() { vcs_info }

# zstyle ':vcs_info:git:*' formats '%b '

# setopt PROMPT_SUBST
PROMPT='%F{blue}%f %F{red}%f%F{green}λ %f'
# [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
# source /usr/share/nvm/bash_completion
# source /usr/share/nvm/install-nvm-exec
# eval "$(zoxide init zsh)"

# set emacs-mode-string "\1\e]133;A\e\\\2"
# Uncomment and/or adjust if you're using the vi editing-mode.
# set vi-cmd-mode-string "\1\e]133;A\e\\\2"
# set vi-ins-mode-string "\1\e]133;A\e\\\2"

setopt emacs
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -s "^V" 'tmux attach -t  $(tmux list-sessions | fzf | sed -e "s/:.*//"  )^M' >/dev/null 2>&1
bindkey '^R' history-incremental-search-backward



[ -f "/home/sigma/.ghcup/env" ] && source "/home/sigma/.ghcup/env" # ghcup-env

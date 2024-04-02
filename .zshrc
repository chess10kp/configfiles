if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway
fi
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

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
bindkey -s "^X" 'cdfzf^M'  >/dev/null 2>&1
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
alias c="clear"
alias sdi="paru -S"
alias sdr="sudo pacman -R"
alias sdu="sudo pacman -Syu"
alias ..="cd .."
alias ...="cd ../../"
alias pm="pacman"
alias fh="cat ~/.zsh_history | fzf | sh"
alias fe="find . \( ! -regex '.*/\..*' \) -type f | fzf | xargs nvim"
alias :q="exit"
alias initnvim="nvim ~/.config/nvim/init.lua" alias inithypr="nvim ~/.config/hypr/hyprland.conf" alias zshrc="nvim ~/.config/.zshrc"
alias ta="tmux attach"
alias td="tmux detach"
alias mkdir="mkdir -p"
alias gcommit="git commit"
alias gpush="git push"
alias gadd="git add"
alias gst="git status"
alias cp="cp -v"
alias mv="mv -i"
alias cdfz="find ./ -type d  | fzf | xargs cd" 

function yt
{
    command yt-dlp -f 'ba' -x --audio-format mp3 "$1" -o '%(title)s.mp3'
}

export PATH="$HOME/.config/emacs/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring # poetry fails to open kdewallet
export EDITOR="nvim"
export PATH="$GOROOT/bin:$PATH"
export GOPATH="$HOME/golib"
export PATH="$GOPATH/bin:$PATH"
export GOPATH="$HOME/projects/go/:$GOPATH"
export QT_QPA_PLATFORMTHEME=qt5ct

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

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f> '

# [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
# source /usr/share/nvm/bash_completion
# source /usr/share/nvm/install-nvm-exec
eval "$(zoxide init zsh)"

[ -f "/home/sigma/.ghcup/env" ] && source "/home/sigma/.ghcup/env" # ghcup-env

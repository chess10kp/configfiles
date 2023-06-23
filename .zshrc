#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000000
bindkey -v
# binds up and down
zstyle :compinstall filename '/home/nitin/.zshrc'

autoload -Uz compinit
compinit
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

alias e="exit"
alias c="clear"
alias sdi="yay -S"
alias sdr="sudo pacman -R"
alias sdu="sudo pacman -Syu"
alias ..="cd .."
alias ...="cd ../../"
alias n="nvim ./"
alias ls="exa"
alias pm="pacman"
alias cd="z"
alias fh="cat ~/.zsh_history | fzf | sh"
alias fe="find . \( ! -regex '.*/\..*' \) -type f | fzf | xargs nvim"
alias :q="exit"
alias initnvim="nvim ~/.config/nvim/init.lua"

function mkcir
{
  command mkdir $1 && cd $1
}

function yt
{
    command yt-dlp -f 'ba' -x --audio-format mp3 "$1" -o '%(title)s.mp3'
}


export EDITOR="nvim"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"
export MPD_PORT="6600"
export NVD_BACKEND="direct"
export _JAVA_AWT_WM_NONREPARENTING=1 # wayland for clion



source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/gitstatus/gitstatus.prompt.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PROMPT='%F{blue}%B%2~%b %F{yellow}%(!.#.➤ )%f '
RPROMPT='$GITSTATUS_PROMPT'

eval "$(zoxide init zsh)"


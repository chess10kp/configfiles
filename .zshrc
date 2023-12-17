if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec Hyprland
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
bindkey -s "^T" 'tmux attach -t  $(tmux list-sessions | fzf | sed -e "s/:.*//"  )^M'
bindkey '^R' history-incremental-search-backward

setopt autocd

function mkcir
{
  command mkdir $1 && cd $1
}
alias e="exit"
alias c="clear"
alias sdi="yay -S"
alias sdr="sudo pacman -R"
alias sdu="sudo pacman -Syu"
alias ..="cd .."
alias ...="cd ../../"
alias pm="pacman"
#alias cd="z"
alias fh="cat ~/.zsh_history | fzf | sh"
alias fe="find . \( ! -regex '.*/\..*' \) -type f | fzf | xargs nvim"
alias :q="exit"
alias initnvim="nvim ~/.config/nvim/init.lua" alias inithypr="nvim ~/.config/hypr/hyprland.conf" alias zshrc="nvim ~/.config/.zshrc"
alias ta="tmux attach"
alias td="tmux detach"
alias mkdir="mkdir -p"
alias gcommit="git commit"
# alias neofetch='neofetch --ascii "$(figlet sigma balls)"| lolcat'
alias gadd="git add"
alias gst="git status"
alias ls="exa "
# alias la="exa -al --icons"
# alias ll="exa -l --icons"
alias cp="cp -v"
alias mv="mv -i"
alias notes="emacs -nw ~/projects/notes/todo.org"
alias daily="touch ~/projects/notes/daily/\"$(date '+%d%m%y').org \"; nvim ~/projects/notes/daily/\"$(date '+%d%m%y').org\""
alias timenow="date '+%d%m%y'"
alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"

function yt
{
    command yt-dlp -f 'ba' -x --audio-format mp3 "$1" -o '%(title)s.mp3'
}

export PATH="$HOME/.config/emacs/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring # poetry fails to open kdewallet

function tmux-run
{
    tmux attach -t  $(tmux list-sessions | fzf | sed -e 's/:.*//'  )
}

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
# source ~/.config/zsh/gitstatus/gitstatus.prompt.zsh
# source ~/.config/zsh/alien-minimal/alien-minimal.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PROMPT='%F{blue}%B%2~%b %F{yellow}%(!.#.➜  )%f '
# RPROMPT='$GITSTATUS_PROMPT'


# [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
# source /usr/share/nvm/bash_completion
# source /usr/share/nvm/install-nvm-exec
eval "$(zoxide init zsh)"

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nitin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#

alias e="exit"
alias c="clear"
alias sdi="yay -S"
alias sdr="sudo pacman -R"
alias sdu="sudo pacman -Syu"
alias ..="cd .."
alias ...="cd ../../"

PROMPT='%B%F{240}%1~%f%b%F{11} %# '

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

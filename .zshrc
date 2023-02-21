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
#

alias e="exit"
alias c="clear"
alias sdi="sudo pacman -S"
alias sdr="sudo pacman -R"
alias sdu="sudo pacman -Syu"
alias wpch=~/.config/scripts/wallpaper_change_wayland.sh
alias ..="cd .."
alias ...="cd ../../"

#TO REMOVE ZAP, rm -rf ~/.local/share/zap
plug "zsh-users/zsh-autosuggestions"

#Prompt
autoload -Uz vcs_info
precmd() { vcs_info } #load git info

zstyle ':vcs_info:git*' actionformats " %r/%S %b %u%c "
setopt PROMPT_SUBST
PROMPT='%B%F{240}%1~%f%b%F{11} %# '


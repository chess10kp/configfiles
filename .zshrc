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



#TO REMOVE ZAP, rm -rf ~/.local/share/zap
plug "zsh-users/zsh-autosuggestions"

#Prompt
autoload -Uz vcs_info
precmd() { vcs_info } #load git info

zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f> '


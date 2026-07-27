if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec start-hyprland
fi

ufetch

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# Alias
alias ls="lsd"
alias cat="bat"
alias "vi"="nvim"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.profile 

bindkey "^[[3~" delete-char # Supr
bindkey "^[[5~" beginning-of-line # HOME
bindkey "^[[2~" end-of-line # END

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

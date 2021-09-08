export ZSH="/usr/share/oh-my-zsh"

ZSH_THEME="brandt"
HIST_STAMPS="%F %T"
plugins=(git) 

source $ZSH/oh-my-zsh.sh

if [ -f ~/.zsh_aliases ]; then
. ~/.zsh_aliases
fi

unsetopt nomatch # https://github.com/hashicorp/terraform/issues/21271#issuecomment-491424517

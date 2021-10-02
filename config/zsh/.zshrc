export ZSH="/usr/share/oh-my-zsh"

ZSH_THEME="brandt"
HIST_STAMPS="%F %T"
plugins=(git) 

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

unalias -m '*'
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

unsetopt nomatch # https://github.com/hashicorp/terraform/issues/21271#issuecomment-491424517

if [[ -v INIT_DIR ]]; then
	cd $INIT_DIR
	unset INIT_DIR
fi

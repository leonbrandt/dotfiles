#PROMPT="%{$fg_bold[green]%}%3~ 🔥 %{$reset_color%}"
PROMPT="%{$fg_bold[green]%}%3~ %{$fg_bold[green]%}⮞ %{$reset_color%}"
PROMPT+='$(git_prompt_info)'
#PROMPT="%(?:%{$fg_bold[green]%}» :%{$fg_bold[red]%}» )"
#PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%})%{$fg_bold[red]%} *⮞"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})%{$fg_bold[green]%} ⮞"

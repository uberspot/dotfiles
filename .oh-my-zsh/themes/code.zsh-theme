local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='%{$fg_bold[green]%}%n %{$fg_bold[white]%}😈  %{$fg_bold[blue]%}%m%{$fg_bold[white]%}: %{$fg_bold[yellow]%}%~ %{$fg_bold[red]%}ϟ%{$reset_color%} '
RPROMPT='%{$fg_bold[cyan]%}$(git_prompt_info)%{$reset_color%}    '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[white]%} ➜%{$fg_bold[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%} ➜%{$fg_bold[green]%} ✓"

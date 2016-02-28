# COLOR ALIASES FOR CLEANER TEXT
MNB=$fg_no_bold[magenta]
R=$fg_bold[red]
G=$fg_bold[green]
M=$fg_bold[magenta]
Y=$fg_bold[yellow]
B=$fg_bold[blue]
C=$fb_bold[cyan]
W=$fg_bold[white]
RESET=$reset_color

# USER OR ROOT SPECIFIC PREFIX
# format: %(!.ROOT_PROMPT.USER_PROMPT)
# currently root doesn't mention the username while normal users do
USER_PREFIX="%(!..%{$G%}%n %{$W%}😈  )";


# GIT
function git_prompt_info() {
      ref=$(git symbolic-ref HEAD 2> /dev/null) || return
      echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(git symbolic-ref -q --short HEAD)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$RESET%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$R%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$G%}"

# RETURN CODE
function return_status() {
    echo "%(?..%{$R%}[%?]%{$RESET%})"
}

# PROMPTS
PROMPT='%{$MNB%}╭╼ $USER_PREFIX%{$B%}%m%{$W%}: %{$Y%}%~ %{$R%}ϟ%{$RESET%}
%{$MNB%}╰╼ %{$RESET%}'

RPROMPT='$(git_prompt_info) $(return_status)'


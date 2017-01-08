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
USER_PREFIX="%(!..%{$G%}[%n] %{$W%}😈 )";

# RETURN CODE
function return_status() {
    echo "%(?..%{$R%}☠ [%?] ☠%{$RESET%})"
}

# PROMPTS
PROMPT="%{$MNB%}╭╼ $USER_PREFIX%{$B%}[%m]%{$RESET%}
%{$MNB%}╰╼ ╭╼ %{$Y%}[%~]
  %{$MNB%} ╰╼ %{$R%}ϟ %{$RESET%}"

RPROMPT="%{$W%} [\$(date \"+%F %H:%M:%S\")] $(return_status)"


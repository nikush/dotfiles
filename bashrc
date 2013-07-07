# vim: ft=sh

# make vim my default editor for everything.
export EDITOR="vim"


# Prompt Configuration

# display a 'v' at the end of the prompt if in a vim subshell
env_vim=`env | grep vim`;
if [[ "$env_vim" == *MYVIMRC* ]]; then
    vim_prompt="v";
else
    vim_prompt="$";
fi

# test to see if __git_ps1 function is available
type -t __git_ps1 > /dev/null
if [ $? -eq 0 ]; then
    # /usr/lib/git-core/git-sh-prompt
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_SHOWCOLORHINTS=true
    PROMPT_COMMAND='__git_ps1 "[\W]" " $vim_prompt "'
else
    export PS1='[\W] $vim_prompt '
fi

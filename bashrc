# vim: ft=sh

# make vim my default editor for everything.
export EDITOR="vim"
export VISUAL="vim"

# make vendor bin easier to get to
export PATH=vendor/bin:$PATH


# Prompt Configuration

# display a 'v' at the end of the prompt if in a vim subshell
env_vim=`env | grep vim`;
if [[ "$env_vim" == *MYVIMRC* ]]; then
    vim_prompt="v";
else
    vim_prompt="$";
fi

# git scripts
. ~/.git-completion.sh
. ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=true
PROMPT_COMMAND='__git_ps1 "[\W]" " $vim_prompt "'

# Local config
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

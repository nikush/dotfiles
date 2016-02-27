# make vim my default editor for everything.
export EDITOR="vim"
export VISUAL="vim"

# make vendor bin easier to get to
export PATH=vendor/bin:$PATH


# Prompt Configuration

# git scripts
. ~/.git-completion.sh
. ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=true

# omg colours!
BLACK="$(tput setaf 0)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
RESET="$(tput sgr0)"

prompt_end()
{
    exitcode=$?
    # display a 'v' at the end of the prompt if in a vim subshell
    if [ -n "$MYVIMRC" ]; then
        prompt_end="v";
    else
        prompt_end="$";
    fi
    if [[ $exitcode == 0 ]]; then
        echo "${GREEN}$prompt_end${RESET}"
    else
        echo "${RED}$prompt_end${RESET}"
    fi
}

PROMPT_COMMAND='__git_ps1 "${BLUE}\u${RESET} at ${RED}\h${RESET} in ${YELLOW}\w${RESET}" "\n$(prompt_end) " " on %s"'
#PROMPT_COMMAND='__git_ps1 "[\W]" " $prompt_end "'
#PROMPT_COMMAND='__git_ps1 "\u@\h:\w" " $prompt_end "'

# aliases
source ~/.dotfiles/bash_aliases

# local config
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

# vim: ft=sh

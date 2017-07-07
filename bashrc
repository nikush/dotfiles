# make vim my default editor for everything.
export EDITOR="vim"
export VISUAL="vim"

# make vendor bin easier to get to
export PATH=vendor/bin:$PATH


# Prompt Configuration

# git scripts
source ~/.git-completion.sh
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=true

prompt_end() {
    # display a 'v' at the end of the prompt if in a vim subshell
    if [ -n "$MYVIMRC" ]; then
        echo "v"
    else
        echo "$"
    fi
}

PROMPT_COMMAND='__git_ps1 "[\W]" " $(prompt_end) "'

# aliases
source ~/.dotfiles/bash_aliases

# local config
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

# vim: ft=sh

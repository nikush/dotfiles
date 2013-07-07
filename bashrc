# vim: ft=sh

# Color ubuntu terminal with solarized theme
# http://xorcode.com/2011/04/11/solarized-vim-eclipse-ubuntu/

# Color Variables {{{
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt#List_of_colors_for_prompt_and_Bash
txtblk="\033[0;30m" # Black - Regular
txtred="\033[0;31m" # Red
txtgrn="\033[0;32m" # Green
txtylw="\033[0;33m" # Yellow
txtblu="\033[0;34m" # Blue
txtpur="\033[0;35m" # Purple
txtcyn="\033[0;36m" # Cyan
txtwht="\033[0;37m" # White

bldblk="\033[1;30m" # Black - Bold
bldred="\033[1;31m" # Red
bldgrn="\033[1;32m" # Green
bldylw="\033[1;33m" # Yellow
bldblu="\033[1;34m" # Blue
bldpur="\033[1;35m" # Purple
bldcyn="\033[1;36m" # Cyan
bldwht="\033[1;37m" # White

undblk="\033[4;30m" # Black - Underline
undred="\033[4;31m" # Red
undgrn="\033[4;32m" # Green
undylw="\033[4;33m" # Yellow
undblu="\033[4;34m" # Blue
undpur="\033[4;35m" # Purple
undcyn="\033[4;36m" # Cyan
undwht="\033[4;37m" # White

bakblk="\033[40m"   # Black - Background
bakred="\033[41m"   # Red
badgrn="\033[42m"   # Green
bakylw="\033[43m"   # Yellow
bakblu="\033[44m"   # Blue
bakpur="\033[45m"   # Purple
bakcyn="\033[46m"   # Cyan
bakwht="\033[47m"   # White

txtrst="\033[0m"    # Text Reset
# }}}

# Prompt Configuration

env_vim=`env | grep vim`;
if [[ "$env_vim" == *MYVIMRC* ]]; then
    vim_prompt="v";
else
    vim_prompt="$";
fi

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


# make vim my default editor for everything.
export EDITOR="vim"

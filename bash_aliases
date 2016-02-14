# unix
alias ln='ln -v'
alias lh='ls -Alh'

alias fuck='sudo $(history -p !!)'

# include custom aliases
[[ -f ~/.bash_aliases.local ]] && source ~/.bash_aliases.local

# vim: ft=sh

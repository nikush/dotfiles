# vim: ft=sh

# Unix
alias ln='ln -v'
alias lh='ls -Alh'

alias fuck='sudo !!'

# Include custom aliases
[[ -f ~/.bash_aliases.local ]] && source ~/.bash_aliases.local

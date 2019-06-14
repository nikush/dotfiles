autoload -Uz promptinit
promptinit
prompt adam2

source ~/.git-prompt.sh

zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)

autoload -U compinit && compinit
zmodload -i zsh/complist

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

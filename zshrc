# ignore dupe commands in the history
setopt histignoredups

# git autocompletion
#fpath=(~/.zsh $fpath)
#zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
autoload -Uz compinit && compinit

# direnv
eval "$(direnv hook zsh)"

# aws-cli
export PATH=$HOME/.local/bin:$PATH

export PATH=$HOME/.vc/bin:$PATH

# starship prompt
eval "$(starship init zsh)"

# podman/docker
export PODMAN_COMPOSE_WARNING_LOGS=false
export PODMAN_COMPOSE_NAME_SEPARATOR_COMPAT=true
export DOCKER_INTERNAL_SOCKET=/run/podman/podman.sock

# local overrides & secrets (not tracked)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

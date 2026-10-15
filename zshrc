# ignore dupe commands in the history
setopt histignoredups

# git autocompletion
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
autoload -Uz compinit && compinit

# kubectl
export KUBECONFIG=~/.kube/config

# direnv
eval "$(direnv hook zsh)"

export PATH=$HOME/.vc/bin:$PATH

# nvim
export NVM_DIR="$HOME/.nvm"
export NVM_SYMLINK_CURRENT=true
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# starship prompt
eval "$(starship init zsh)"

# podman/docker
export PODMAN_COMPOSE_WARNING_LOGS=false
export PODMAN_COMPOSE_NAME_SEPARATOR_COMPAT=true
export DOCKER_INTERNAL_SOCKET=/run/podman/podman.sock

# local overrides & secrets (not tracked)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

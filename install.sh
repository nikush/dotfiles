# Title       : install.sh
# Date        : 2013-01-04
# Author      : Nikush Patel
# Version     : 1.0
# Description : Install dotfiles from the .dotfiles repository
# Options     : None

if [ ! -e ~/.vimrc ]; then
    ln -s ~/.dotfiles/vimrc ~/.vimrc
else
    printf "\e[1m%s\e[0m %s\n" ".vimrc" "file already present. Skipped."
fi

if [ ! -e ~/.vim ]; then
    ln -s ~/.dotfiles/vim ~/.vim
else
    printf "\e[1m%s\e[0m %s\n" ".vim" "directory already present. Skipped."
fi

if [ -e ~/.bashrc ]; then
    printf "%s" ".bashrc file already present, append line to source bashrc file from dotfiles repository? (y/n) "
    read response
    if [ -n "$response" ] && [ $response = "y" ]; then
        bashrc_source=". ~/.dotfiles/bashrc"
        printf "\n\n%s" "$bashrc_source" >> ~/.bashrc
    fi
else
    ln -s ~/.dotfiles/bashrc ~/.bashrc
fi

printf "%s" "Initialise vim plugin submodules? (y/n) "
read response
if [ -n "$response" ] && [ $response = "y" ]; then
    git submodule update --init
fi

# create vim cache
mkdir -p ~/.cache/vim/{swap,backup,undo}

printf "\e[32m%s\e[0m\n" "Installation complete!"

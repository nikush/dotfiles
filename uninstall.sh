# Title       : uninstall.sh
# Date        : 2013-01-04
# Author      : Nikush Patel
# Version     : 1.0
# Description : Uninstall dotfiles linked to the .dotfiles repository
# Options     : None

if [ -e ~/.vimrc ]; then
    if [ -L ~/.vimrc ]; then
        rm ~/.vimrc
    else
        printf "%s\n" ".vimrc is not a symlink. Skipped."
    fi
else
    printf "%s\n" ".vimrc doesn't exist. Skipped."
fi

if [ -e ~/.vim ]; then
    if [ -L ~/.vim ]; then
        rm ~/.vim
    else
        printf "%s\n" ".vim is not a symlink. Skipped."
    fi
else
    printf "%s\n" ".vim doesn't exist. Skipped."
fi

if [ -e ~/.bashrc ]; then
    if [ -L ~/.bashrc ]; then
        rm ~/.bashrc
    else
        printf "%s\n> \e[1m%s\e[0m\n" "Don't forget to remove the line from your bashrc file that sources the bashrc from the dotfiles repository:" ". ~/.dotfiles/bashrc"
    fi
fi

# remove the cache used with this setup
rm -r ~/.cache/vim

printf "\e[32m%s\e[0m\n" "Uninstallation complete!"

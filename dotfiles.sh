#!/usr/bin/env bash

# dotfiles install/uninstall script

# list of files to work with
FILES=(bashrc bash_aliases gitconfig vimrc vim gvimrc tmux.conf)
FORMAT_FILE_BOLD="\e[1m%s\e[0m => %s\n"
FORMAT_GREEN="\e[32m%s\e[0m\n"

function help {
    cat << EOF
dotfiles install/uninstall script

commands:
    up|install        Install the dotfiles
    down|uninstall    Uninstall the dotfiles
EOF
}

# Install all the dotfiles
function install_dotfiles {
    printf "$FORMAT_GREEN" "Installing dotfiles..."

    for file in ${FILES[*]}; do
        install_file $file
    done

    # create vim cache
    mkdir -p ~/.cache/vim/{swap,backup,undo}

    printf "$FORMAT_GREEN" "Done!"
}

# Sym-links the file "$1" from the repository to the home directory
# $1: The file to install
function install_file {
    local file=$1
    if [ ! -e ~/.$file ]; then
        ln -s ~/.dotfiles/$file ~/.$file
        printf "$FORMAT_FILE_BOLD" ".$file" "installed."
    else
        printf "$FORMAT_FILE_BOLD" ".$file" "already present. Skipped."
    fi
}

# Remove all of the dotfiles
function uninstall_dotfiles {
    printf "$FORMAT_GREEN" "Uninstalling dotefiles..."

    for file in ${FILES[*]}; do
        uninstall_file $file 0
    done

    # remove vim cache
    rm -rf ~/.cache/vim

    printf "$FORMAT_GREEN" "Done!"
}

# Removes the file "$1" from the home directory
# $1: The file to remove
# $2: Pass the value "1" to forcefully remove the file even if it is not a
# symlink
function uninstall_file {
    local file=$1
    if [ -e ~/.$file ]; then
        if [ -L ~/.$file ] || [ "$2" -eq "1" ]; then
            rm ~/.$file
            printf "$FORMAT_FILE_BOLD" ".$file" "uninstalled."
        else
            printf "$FORMAT_FILE_BOLD" ".$file" "is not a symlink. Skipped."
        fi
    else
        printf "$FORMAT_FILE_BOLD" ".$file" "doesn't exist. Skipped."
    fi
}


case $1 in
    up|install)
        install_dotfiles
        ;;
    down|uninstall)
        uninstall_dotfiles
        ;;
    *)
        help
        ;;
esac

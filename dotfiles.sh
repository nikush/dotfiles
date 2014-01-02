#!/usr/bin/env bash

# dotfiles install/uninstall script

# list of files to work with
files=(bashrc aliases gitconfig vimrc vim gvimrc)
format_file_bold="\e[1m%s\e[0m %s\n"

function help {
    cat << EOF
dotfiles install/uninstall script

commands:
    install     Install the dotfiles
    uninstall   Uninstall the dotfiles
EOF
}

# Sym-links the file "$1" from the repository to the home directory
# $1: The file to install
function install_file {
    local file=$1
    if [ ! -e ~/.$file ]; then
        ln -s ~/.dotfiles/$file ~/.$file
        printf "$format_file_bold" ".$file" "installed."
    else
        printf "$format_file_bold" ".$file" "already present. Skipped."
    fi
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
            printf "$format_file_bold" ".$file" "uninstalled."
        else
            printf "$format_file_bold" ".$file" "is not a symlink. Skipped."
        fi
    else
        printf "$format_file_bold" ".$file" "doesn't exist. Skipped."
    fi
}

# Install all the dotfiles
function install_dotfiles {
    for file in ${files[*]}; do
        install_file $file
    done

    # additional git scripts
    # download if unobtainable locally
    if [ ! -e ~/.git-prompt.sh ]; then
        if [ -e /usr/lib/git-core/git-sh-prompt ]; then
            ln -s /usr/lib/git-core/git-sh-prompt ~/.git-prompt.sh
        else
            wget -q https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
        fi
        printf "$format_file_bold" ".git-prompt.sh" "installed."
    else
        printf "$format_file_bold" ".git-prompt.sh" "already present. Skipped."
    fi
    if [ ! -e ~/.git-completion.sh ]; then
        wget -q https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.sh
        printf "$format_file_bold" ".git-completion.sh" "installed."
    else
        printf "$format_file_bold" ".git-completion.sh" "already present. Skipped."
    fi

    echo "Initialising vim plugin submodules"
    git submodule update --init

    # create vim cache
    mkdir -p ~/.cache/vim/{swap,backup,undo}

    printf "\e[32m%s\e[0m\n" "Installation complete!"
}

# Remove all of the dotfiles
function uninstall_dotfiles {
    for file in ${files[*]}; do
        uninstall_file $file
    done

    # additional git scripts
    uninstall_file git-completion.sh 1
    uninstall_file git-prompt.sh 1

    # remove vim cache
    rm -rf ~/.cache/vim

    printf "\e[32m%s\e[0m\n" "Uninstallation complete!"
}

if [ $# -eq 0 ]; then
    help
    exit 0
fi

case $1 in
    install)
        install_dotfiles
        ;;
    uninstall)
        uninstall_dotfiles
        ;;
    *)
        help
        ;;
esac

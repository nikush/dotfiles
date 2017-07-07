#!/usr/bin/env bash

# dotfiles install/uninstall script

# list of files to work with
FILES=(bashrc bash_aliases gitconfig vimrc vim gvimrc)
FORMAT_FILE_BOLD="\e[1m%s\e[0m %s\n"

function help {
    cat << EOF
dotfiles install/uninstall script

commands:
    up      Install the dotfiles
    down    Uninstall the dotfiles
EOF
}

# Install all the dotfiles
function install_dotfiles {
    for file in ${FILES[*]}; do
        install_file $file
    done

    download_git_scripts

    # create vim cache
    mkdir -p ~/.cache/vim/{swap,backup,undo}

    printf "\e[32m%s\e[0m\n" "Installation complete!"
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

function download_git_scripts {
    local prompt_url=https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
    local completion_url=https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

    # additional git scripts
    # download if unobtainable locally
    if [ ! -e ~/.git-prompt.sh ]; then
        if [ -e /usr/lib/git-core/git-sh-prompt ]; then
            ln -s /usr/lib/git-core/git-sh-prompt ~/.git-prompt.sh
        else
            download $prompt_url ~/.git-prompt.sh
        fi
        printf "$FORMAT_FILE_BOLD" ".git-prompt.sh" "installed."
    else
        printf "$FORMAT_FILE_BOLD" ".git-prompt.sh" "already present. Skipped."
    fi

    if [ ! -e ~/.git-completion.sh ]; then
        download $completion_url ~/.git-completion.sh
        printf "$FORMAT_FILE_BOLD" ".git-completion.sh" "installed."
    else
        printf "$FORMAT_FILE_BOLD" ".git-completion.sh" "already present. Skipped."
    fi
}
# download a file
# $1: The source URL to download
# $2: The target location to download to
function download {
    local sauce=$1
    local target=$2

    if type curl >> /dev/null; then
        curl --silent $sauce --output $target
    else
        wget -q $sauce -O $target
    fi
}

# Remove all of the dotfiles
function uninstall_dotfiles {
    for file in ${FILES[*]}; do
        uninstall_file $file 0
    done

    # additional git scripts
    uninstall_file git-completion.sh 1
    uninstall_file git-prompt.sh 1

    # remove vim cache
    rm -rf ~/.cache/vim

    printf "\e[32m%s\e[0m\n" "Uninstallation complete!"
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
    up)
        install_dotfiles
        ;;
    down)
        uninstall_dotfiles
        ;;
    *)
        help
        ;;
esac

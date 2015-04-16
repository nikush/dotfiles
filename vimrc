set nocompatible

" Vundle stuff
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'AndrewRadev/switch.vim'
Plugin 'bling/vim-airline'
Plugin 'evidens/vim-twig'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'miyakogi/conoline.vim'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'romainl/Apprentice'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/badwolf'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'xsbeats/vim-blade'
call vundle#end()

filetype plugin indent on

let mapleader=","
let maplocalleader="\\"

syntax on
set background=dark
set t_Co=16

if exists('+relativenumber')
    set relativenumber
else
    set number
endif

set showcmd
set laststatus=2
set wildmode=full
set wildmenu

set smartindent
set autoindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set textwidth=80
set wrap
set formatoptions=cqrn
set showbreak=…
set list
set listchars=tab:▸\ ,eol:¬,trail:-,extends:>,precedes:<,nbsp:+

set autoread
set hidden

set incsearch
set ignorecase
set smartcase
set cpoptions+=$
set showmatch

set foldenable

set scrolloff=3

set spelllang=en_gb

set directory=~/.cache/vim/swap//
set backup
set backupdir=~/.cache/vim/backup//
if exists('+undofile')
    set undofile
    set undodir=~/.cache/vim/undo//
endif

" enable sourcing directory specific config files
" http://writtenby.adriengiboire.com/articles/2014-09-30-projects-specific-settings-with-vim/
set exrc

" Get to ex commands quicker
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Arrow keys are for the weak!
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" Repeat last macro
nnoremap <Space> @@
" Remap Q from Ex mode to repeat q macro
" Allows me to quickly record a macro into the q register and start executing it
nnoremap Q @q

" Plugins
let g:gitgutter_enabled = 0

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

nnoremap <leader>- :Switch<cr>
let g:switch_custom_definitions =
            \ [
            \   ['private', 'protected', 'public']
            \ ]

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif

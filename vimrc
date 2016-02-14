" --- Plugins ---

" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" colors
Plugin 'sjl/badwolf'
Plugin 'altercation/vim-colors-solarized'
Plugin 'NLKNguyen/papercolor-theme'

Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'scrooloose/syntastic'
Plugin 'xsbeats/vim-blade'
Plugin 'tmhedberg/matchit'

" tpope
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'

call vundle#end()



" --- General Settings ---

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
set spell

set cursorline
set colorcolumn=+1

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



" --- Mappings ---

" get to ex commands quicker
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" arrow keys are for the weak!
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" repeat last macro
nnoremap <Space> @@
" remap Q from Ex mode to repeat q macro
" allows me to quickly record a macro into the q register and start executing it
nnoremap Q @q



" --- Plugin Settings ---

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:airline_section_z="%l:%c⋅%p%%"
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }



" --- Auto-Commands ---

" automatically source the Vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc,vimrc source $MYVIMRC
    autocmd BufWritePost .gvimrc,gvimrc source $MYGVIMRC
augroup END



" --- Local Configs ---

if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif

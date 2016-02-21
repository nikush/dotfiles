" --------------------------------- Plugins ------------------------------------

" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" colours
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
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" tpope
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-eunuch' "useful for :Remove and :SudoWrite commands
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-abolish' "useful for coercing names from snake case to camel case
Plugin 'tpope/vim-repeat'

call vundle#end()



" ----------------------------- General Settings -------------------------------

filetype plugin indent on

let mapleader=","
let maplocalleader="\\"

syntax on
set background=dark
set t_Co=16

" line numbers and cursor line
set relativenumber
set cursorline

" status bar
set showcmd
set laststatus=2
set wildmode=full
set wildmenu

" indenting
set smartindent
set autoindent

" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" text formatting
set textwidth=80
set colorcolumn=+1
set wrap
set formatoptions=cqrn
set showbreak=…
set list
set listchars=tab:▸\ ,eol:¬,trail:-,extends:>,precedes:<,nbsp:+
set cpoptions+=$ "show $ at the end of the text with something like a C command
set backspace=indent,eol,start

" searching
set incsearch
set ignorecase
set smartcase

" spelling
set spell
set spelllang=en_gb

" buffers
set autoread "update buffer if changed outside of vim
set hidden "allows switching of buffers if they haven't been saved

" backups
set directory=~/.cache/vim/swap//
set backup
set backupdir=~/.cache/vim/backup//
if exists('+undofile')
    set undofile
    set undodir=~/.cache/vim/undo//
endif

" misc
set showmatch "show matching brackets when inserted
set foldenable
set scrolloff=3
" enable sourcing directory specific config files
" http://writtenby.adriengiboire.com/articles/2014-09-30-projects-specific-settings-with-vim/
set exrc



" --------------------------------- Mappings -----------------------------------

" quickly edit vimrc
nnoremap <Leader>ev :tabedit $MYVIMRC<cr>

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



" ----------------------------- Plugin Settings --------------------------------

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



" ------------------------------ Auto-Commands ---------------------------------

" automatically source the Vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc,vimrc source $MYVIMRC
    autocmd BufWritePost .gvimrc,gvimrc source $MYGVIMRC
augroup END



" ------------------------------ Local Configs ---------------------------------

if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif

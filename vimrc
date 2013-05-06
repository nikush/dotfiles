runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nocompatible
filetype plugin indent on

let mapleader=","
let maplocalleader="\\"

syntax on
set background=dark
set t_Co=16
"let g:solarized_termcolors=16
"colorscheme default

set relativenumber
"set cursorline
"set cursorcolumn
"set colorcolumn=+1

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

set hlsearch
set incsearch
set cpoptions+=$
set showmatch

set foldenable
set foldcolumn=1

set scrolloff=3

set spell
set spelllang=en_gb

set directory=~/.cache/vim/swap//
set backup
set backupdir=~/.cache/vim/backup//
set undofile
set undodir=~/.cache/vim/undo//

" Arrow keys are for the weak!
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" status line {{{
set statusline=        " clear the status line
set statusline+=%<     " truncate at start
set statusline+=%f\    " path to file
set statusline+=%h%m%r " help, modified, read only flags
set statusline+=%y     " file type
set statusline+=[%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]\    " file format

" warnings
set statusline+=%#Error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%{StatuslineTrailingWhitespaceWarning()}
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*  " reset colour

set statusline+=%=      " right align everything else
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%-.12(L:%l,C:%c%V%) " line, column
set statusline+=\ %P    " percent through file

" http://got-ravings.blogspot.co.uk/2008/10/vim-pr0n-statusline-whitespace-flags.html
" recalculate tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" return '[&expandtab]' if &et is set wrong (indenting with tabs when you should
" be using spaces, and vice versa)
" return '[mixed-indenting]' if spaces and tabs are used to indent
" return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&expandtab]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

" return [\s] if trailing whitespace is detected
function! StatuslineTrailingWhitespaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nW') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction
" }}}

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

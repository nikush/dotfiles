" PATHOGEN {{{1
" read pathogen from its own bundle
runtime bundle/pathogen/autoload/pathogen.vim

" turn filetype on then off to fix small bug with git commit messages
" http://tooky.github.com/2010/04/08/there-was-a-problem-with-the-editor-vi-git-on-mac-os-x.html
" if filetype is already off, then trying to turn it off again results in a bad
" exit status, so I turn it on then off to resole this.
filetype on
filetype off
call pathogen#infect()
" }}}1

" TABS
set tabstop=4       " Width of the <Tab> key
set softtabstop=4   " Number of spaces if expandtab is set
set shiftwidth=4    " Number of spaces used for autoindents. including '>>'
set expandtab       " Expand tabs into spaces

" BASIC SETTINGS {{{1
" Forget compatibility with Vi. Who cares?
set nocompatible

let mapleader=","
let maplocalleader="\\"

set relativenumber

" Syntax / Colours
syntax on
set background=dark
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

" Typography
"set guifont=M+\ 1m\ regular:h11,Monaco:h10
"set linespace=0

" Enable current line and column highlighting
set cursorline
set cursorcolumn
set colorcolumn=+1  " Display column to align text

" Indenting
set smartindent
set autoindent

" Enable file types
filetype on
filetype plugin on
filetype indent on

" Read in new file if it has been updated outside of Vim
set autoread
" Switch between buffers without saving
set hidden

set hlsearch        " highlight search results
set incsearch       " Incremental searching
set cpoptions+=$    " Add '$' to indicate the end of a change until command

" When a bracket is typed, jump to the matching one for a quick second
set showmatch

" Wild menu
set wildmode=full
set wildmenu

" Folding
set foldenable
set foldmethod=marker
set foldcolumn=1

" Hide mouse when typing
set mousehide

" Set invisible characters
set listchars=tab:▸\ ,eol:¬

" Window splitting
set splitbelow
set splitright

" Set time-out length for how long to wait before command is executed
" because Vim waits to see if another key is going to be pressed
set timeoutlen=500

" Offset cursor position by 8 lines form edge when scrolling
set scrolloff=8
" }}}1

" STATUS LINE {{{
set showcmd         " show incomplete command in status line
set laststatus=2    " Always display the status bar

" format the status line
set statusline=     " clear the status line
set statusline+=%<  " truncate at start
set statusline+=%f\     " path to file
set statusline+=%h%m%r  " help, modified, read only flags
set statusline+=%y    " file type
set statusline+=[%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]\    " file format

" display a warning if the file is using mixed indenting
set statusline+=%#Error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%{StatuslineTrailingWhitespaceWarning()}
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*  " reset colour

set statusline+=%=  " right align everything else
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%-.12(L:%l,C:%c%V%) " line, columns
set statusline+=\ %P    " percent through file

" http://got-ravings.blogspot.co.uk/2008/10/vim-pr0n-statusline-whitespace-flags.html
" recalculate tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[&expandtab]' if &et is set wrong (indenting with tabs when you should
"  be using spaces, and vice versa)
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
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

" TEXT FORMATTING {{{1
set wrap        " Better line wrapping
set textwidth=80
set formatoptions=cqrn1
" c     Autowrap comments using text width
" q     Allow of comments with `gq`
" r     Add comment leader after hitting `<Enter>`
" n     Recognise numbered lists, doesn't seem to work though :(
" 1     Break a line after a one letter word, not before it
set linebreak   " don't break words when wrapping text
set showbreak=… " begin wrapped lines with an ellipses
" }}}1

" SPELLING {{{1
" Enable spell checking for British English
set spell
set spelllang=en_gb
" Clean up spell file with:
" :runtime spell/cleanadd.vim
" }}}1

" ABBREVIATIONS / MAPPINGS {{{1
" Make the current word uppercase
inoremap <c-u> <esc>viwUea

" Use tab to indent and unindent lines in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

iabbrev @@ nik@nikush.co.uk
iabbrev ccopy "Copyright" 2012 Nikush Patel
iabbrev ssig --<cr>Nikush Patel<cr>nik@nikush.co.uk

"Markdown to HTML
vnoremap <leader>md :! /usr/local/bin/Markdown.pl --html4tags <cr>
nnoremap <leader>md :%! /usr/local/bin/Markdown.pl --html4tags <cr>

" search for the word under the cursor in every file within the current
" directory, recursively
" nnoremap <leader>g :silent execute "grep! -R " . shellescape("<cWORD>") . " ."<cr>:copen 5<cr>

" Code hints pop-up
"set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  "\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  "\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" }}}1

" MOVEMENT {{{1
" Arrow keys are for the weak!
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
" }}}1

" BACKUPS {{{1
set backup " enable backup
set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/swap

" Undo persistence
" Create a `.vim-undo/` directory in the project folder to start using
" persistent undo history
"set undofile
"set undodir=.vim-undo/
"}}}1

" COMMANDS / FUNCTIONS {{{1
" Automatically change current directory to that of the file in the buffer
"autocm BufEnter * cd %:p:h

" My version of strip trailing white
nnoremap <leader>w :call TrailingSpaces()<cr>
function! TrailingSpaces()
    execute "normal! /\\v\\s+$"."\<cr>"
endfunction

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Call StripTrailingWhitespaces when file is saved
"autocmd BufWritePre *.html,*.css,*.js,*.php :call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"nnoremap <c-q> :call <SID>QuickFixToggle()<cr>

let g:quickfix_is_open=0

function! s:QuickFixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open=0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr();
        copen
        let g:quickfix_is_open=1
    endif
endfunction
" }}}1

" FILE-SPECIFIC SETTINGS {{{1
" custom status line for markdown files
augroup filetype_md
    autocmd!
    "autocmd FileType markdown setlocal statusline=%f%=%l/%L
    autocmd FileType markdown setlocal tabstop=2
    autocmd FileType markdown setlocal softtabstop=2
    autocmd FileType markdown setlocal shiftwidth=2
augroup END

" html files shouldn't have a text width
augroup html_textwidth
    autocmd!
    autocmd FileType html setlocal textwidth=0
augroup END
" }}}1

" Use an awesome colorscheme that supports hex values
colorscheme badwolf

" Fonts
set guifont=Ubuntu\ Mono\ 12

set cursorline
set colorcolumn=+1

" Hide various gui elements
set guioptions-=T   " remove toolbar
set guioptions-=L   " remove left hand scrollbar
set guioptions-=r   " remove right hand scrollbar

" Disable use of the mouse
set mouse-=a

" Spell check highlighting is too obtrusive in terminal vim
set spell

" Plugins
let g:gitgutter_enabled = 1

" Local config
if filereadable($HOME . "/.gvimrc.local")
    source ~/.gvimrc.local
endif

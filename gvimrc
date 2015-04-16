" Use an awesome colorscheme that supports hex values
set t_Co=256
colorscheme badwolf

" Fonts
set guifont=Ubuntu\ Mono\ 12

" Hide various gui elements
set guioptions-=T   " remove toolbar
set guioptions-=L   " remove left hand scrollbar
set guioptions-=r   " remove right hand scrollbar

" Disable use of the mouse
set mouse-=a

" Local config
if filereadable($HOME . "/.gvimrc.local")
    source ~/.gvimrc.local
endif

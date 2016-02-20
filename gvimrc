" colours
set t_Co=256
colorscheme badwolf

" typography
set guifont=Ubuntu\ Mono\ 12
"set guifont=Ubuntu\ Mono:h12 " MacVim
set linespace=5

" tweak gui
set guioptions-=T "remove toolbar
set guioptions-=L "remove left hand scrollbar
set guioptions-=r "remove right hand scrollbar
set mouse-=a " disable use of the mouse

" local config
if filereadable($HOME . "/.gvimrc.local")
    source ~/.gvimrc.local
endif

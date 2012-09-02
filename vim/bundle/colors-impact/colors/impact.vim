" Maintainer:   Nikush Patel <nik@nikush.co.uk>
" Web:          http://www.nikush.co.uk
" Last Change:  2012 Jan 04

set background=dark

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name="impact"


" GUI Coloring {{{
" General
hi Normal       guifg=#FFFFFF   guibg=#222222   gui=none
hi Cursor       guifg=NONE      guibg=#666666   gui=none
hi CursorLine   guifg=NONE      guibg=#111111   gui=none
hi CursorColumn guifg=NONE      guibg=#333333   gui=none
hi ColorColumn  guifg=NONE      guibg=#333333   gui=none
hi LineNr       guifg=#444444   guibg=#000000   gui=none
hi NonText      guifg=#EE3333   guibg=NONE      gui=none    " end of line, all empty space on new window welcome message
hi SpecialKey   guifg=#EE3333   guibg=NONE      gui=none    " tabs, keywords on welcome screen
hi Title        guifg=#99FF33   guibg=NONE      gui=none    " :autocmd to see titles in action
hi VertSplit    guifg=#222222   guibg=#333333   gui=none
hi Visual       guifg=#FFFFFF   guibg=#FF0077   gui=none
hi MatchParen   guifg=#000000   guibg=#99FF33   gui=none
hi Directory    guifg=#CCCCCC   guibg=NONE      gui=none

" Status Line
hi StatusLine   guifg=#000000   guibg=#99FF33   gui=none
hi StatusLineNC guifg=#999999   guibg=#333333   gui=none
hi WildMenu     guifg=#ffffff   guibg=#111111   gui=none

" Folds
hi Folded       guifg=#444444   guibg=#000000   gui=none
hi FoldColumn   guifg=#222222   guibg=#000000   gui=none

" Search
hi Search       guifg=#000000   guibg=#55DDFF   gui=none
hi IncSearch    guifg=#000000   guibg=#FFFF00   gui=none

" Pmenu
hi Pmenu        guifg=#FFFFFF   guibg=#444444   gui=none
hi PmenuSel     guifg=#000000   guibg=#99FF33   gui=none
hi PmenuThumb   guifg=NONE      guibg=#FFFFFF   gui=none
hi PmenuSbar    guifg=NONE      guibg=#000000   gui=none

" Messages
hi ModeMsg      guifg=#666666   guibg=NONE      gui=none
hi MoreMsg      guifg=#55DDFF   guibg=NONE      gui=none
hi Question     guifg=#99FF33   guibg=NONE      gui=none    " seen with :ls
hi WarningMsg   guifg=#EE3333   guibg=NONE      gui=none
hi ErrorMsg     guifg=#FFFFFF   guibg=#EE3333   gui=none

" Diffs
hi DiffAdd      guifg=#99FF33   guibg=NONE      gui=none
hi DiffDelete   guifg=#EE3333   guibg=NONE      gui=none
hi DiffChange   guifg=#FFAA44   guibg=NONE      gui=none
hi DiffText     guifg=#000000   guibg=#55DDFF   gui=none

" }}}

" Syntax {{{
" Generic Highlighting
hi Comment      guifg=#999999   guibg=NONE      gui=none
hi Todo         guifg=#FFAA44   guibg=NONE      gui=none    " Notes in help files ("Note:")
hi Statement    guifg=#55DDFF   guibg=NONE      gui=none    " if, let, set, html tag names
hi Type         guifg=#FFAA44   guibg=NONE      gui=none    " guifg, guibg, on, php : ->
hi Boolean      guifg=#EE3333   guibg=NONE      gui=none
hi String       guifg=#AAEE22   guibg=NONE      gui=none
hi Number       guifg=#FFAA44   guibg=NONE      gui=none
hi Constant     guifg=#EE3333   guibg=NONE      gui=none
hi Function     guifg=#EE3333   guibg=NONE      gui=none
hi PreProc      guifg=#FF0077   guibg=NONE      gui=none    " none, Maintainer, Last Changed, any setting
hi Special      guifg=#55DDFF   guibg=NONE      gui=none    " (  ), <leader>, linked text in help doc
hi Keyword      guifg=#FFFFFF   guibg=NONE      gui=none    " javascript : document keyword
hi Identifier   guifg=#FFFFFF   guibg=NONE      gui=none    " tags in help files
" }}}

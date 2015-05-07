set guifont=Monospace\ 12
if v:version > 700
	set cursorline
  set cursorcolumn
	hi CursorLine ctermbg=Red guibg=#771c1c
	hi CursorColumn ctermbg=Red guibg=#771c1c
"	call ExpextCursorSlowDown()
endif
"
"added 2014/11/04
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2

map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
\set guioptions-=T <Bar>
\set guioptions-=m <bar>
\else <Bar>
\set guioptions+=T <Bar>
\set guioptions+=m <Bar>
\endif<CR>
"remove toolbar"
""set guioptions-=T
"remove menu"
""set guioptions-=m
set gcr=a:block-blinkon0
hi LineNr guifg=#857b6f guibg=#000000 gui=none
:inoremap ( ()<esc>i
se background=dark
let g:Powerline_colorscheme='solarized256'

set vb t_vb=

:match ErrorMsg /\%>70v.\+/
hi CursorLine ctermbg=Red guibg=#771c1c
hi CursorColumn ctermbg=Red guibg=#771c1c

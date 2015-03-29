"Copyright 2013 Xueyang Liu, all rights reserved.
"www.cnblogs.com/liuxueyang/
"Hunan University


" ********************SET********************
"color molokai
color solarized
se background=dark
"se background=light
let &termencoding=&encoding
set fileencodings=utf-8,gbk
set nocompatible
set guifont=Monaco:h19
set nu numberwidth=5
set cindent
set ai
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set mouse=a
set autochdir
se hlsearch incsearch 
se ruler
set laststatus=2
set cmdheight=2
set nowrap
syntax on
syntax enable
filetype plugin indent on
""filetype indent on
""filetype plugin on

" ********************MAP********************
let mapleader=","
noremap <space> ve
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>pv :sp $MYVIMRC<cr>
nnoremap <leader>egv :vsplit $MYGVIMRC<cr>
nnoremap <leader>pgv :sp $MYGVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sgv :source $MYGVIMRC<cr>
nnoremap wt :WMToggle<cr> 
nnoremap <c-t> :NERDTree<cr>
nnoremap <c-a> :Tlist<cr>
vnoremap <leader>y "+y
nmap <leader>p "+p
nmap <leader>q :q<CR>
nmap <leader>xa :xa<CR>
nmap <leader>w :w<CR>
nnoremap nw <C-w><C-w>
nnoremap <leader>lw <C-w>l
nnoremap <leader>hw <C-w>h
nnoremap <leader>on :only<CR>
nnoremap <leader>kw <C-w>k
nnoremap <leader>jw <C-w>j
nmap <leader>pa %
"在某个单词上加上引号，括号
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>< viw<esc>a><esc>'<i<<esc>lw
"~~~~~~~~~~~~~~~大风歌~~~~~~~~~~~~~~~
vnoremap \ U
inoremap <c-d> <esc>ddi
inoremap <c-u> <esc>veU
inoremap <D> <esc>
"括号,引号自动补全
:inoremap ( ()<esc>i
:inoremap ) <c-r>=ClosePair(')')<cr>
:inoremap { {}<esc>i
:inoremap } <c-r>=ClosePair('}')<cr>
:inoremap [ []<esc>i
:inoremap ] <c-r>=ClosePair(']')<cr> 
:inoremap " ""<esc>i
:inoremap ' ''<esc>i
onoremap p i(
onoremap b /return<cr>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
endf

" ********************OTHER********************
iabbrev @@ www.cnblogs.com/liuxueyang/
iabbrev ccopy Copyright 2013 Xueyang Liu, all rights reserved.
autocmd BufWritePre *.html :normal gg=G

"pathogen{
execute pathogen#infect()
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
"}


"taglist{
		let Tlist_File_Fold_Auto_Close=1
    let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
    let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
    let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
    let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
    let Tlist_Ctags_Cmd='/opt/local/bin/ctags'  "设置ctags命令的位置
    nnoremap <leader>tl : Tlist<CR>        "设置关闭和打开taglist窗口的快捷键
"}


let g:user_emmet_settings = {
			\ 'php' : {
			\'extends' : "html",
			\'filters' : 'c',
			\},
			\'xml' : {
			\ 'extends' : 'html',
			\},
			\'haml' : {
			\'extends' : 'html',
			\},
			\}

let g:pydoc_cmd = '/usr/bin/pydoc3.2'
map <leader>r :w<CR>:!python3 %<CR>

:nmap <Leader>we <Plug>VimwikiSplitLink
:nmap <Leader>wq <Plug>VimwikiVSplitLink
":nmap <Leader>wt <Plug>VimwikiTabnewLink
let NERDTreeWinSize=22
let g:C_ExeExtension = '.exe'

let g:instant_markdown_autostart = 1

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

set cursorline
set cursorcolumn

"
"added 2014/11/04
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
hi LineNr ctermfg=101 ctermbg=16 term=none

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

autocmd BufRead *.lsp,*.lisp so ~/.vim/bundle/VIlisp-2.3/VIlisp.vim

"vim-indent-guides"
let g:indent_guides_auto_colors = 1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
""autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
""autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
""hi IndentGuidesOdd  guibg=white   ctermbg=3
""hi IndentGuidesEven guibg=lightgrey ctermbg=4
:nmap <silent> <leader>i <Plug>IndentGuidesToggle

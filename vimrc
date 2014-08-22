"Copyright 2013 Xueyang Liu, all rights reserved.
"www.cnblogs.com/liuxueyang/
"Hunan University


" ********************SET********************
color desert
let &termencoding=&encoding
set fileencodings=utf-8,gbk
set nocompatible
set guifont=Monaco:h19
set nu numberwidth=5
set cindent
set ai
set tabstop=2
set shiftwidth=2 
set mouse=a
set autochdir
se hlsearch incsearch 
se ruler
set laststatus=2
set cmdheight=2
syntax on
syntax enable
filetype plugin indent on
filetype indent on
filetype plugin on

" ********************MAP********************
let mapleader=","
noremap <space> ve
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>pv :sp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap wt :WMToggle<cr> 
nnoremap <c-t> :NERDTree<cr>
nnoremap <c-a> :Tlist<cr>
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

""function ClosePair(char)
""	if getline('.')[col('.') - 1] == a:char
""		return "\<Right>"
""	else
""		return a:char
""endf
""
" ********************OTHER********************
iabbrev @@ www.cnblogs.com/liuxueyang/
iabbrev ccopy Copyright 2013 Xueyang Liu, all rights reserved.
autocmd BufWritePre *.html :normal gg=G
"下面这些autocmd还没有学会=_=
"autocmd FileType C++ nnoremap <buffer> <localleader>c I//<esc>
"autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
"autocmd FileType javascript :iabbrev <buffer> iff if()<left>
"autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
"autocmd FileType python : iabbrev <buffer> iff if:<left>
"echo ">^.^<"

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

source ~/.vim/bundle/cscope_maps.vim
let g:pydoc_cmd = '/usr/bin/pydoc3.2'
map <leader>r :w<CR>:!python3 %<CR>

:nmap <Leader>we <Plug>VimwikiSplitLink
:nmap <Leader>wq <Plug>VimwikiVSplitLink
":nmap <Leader>wt <Plug>VimwikiTabnewLink
let NERDTreeWinSize=22
let g:C_ExeExtension = '.exe'

"cscope
if has("cscope")
	set csprg=/usr/local/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
			cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
			cs add $CSCOPE_DB
	endif
	set csverb
endif
"

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

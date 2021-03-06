"Copyright 2013 Xueyang Liu, all rights reserved.
"liuxueyang.github.io
"Hunan University

"Updated on 2016/03/22 Lpaste"
"Updated on 2016/04/06 Lpaste"
"Updated on 2016/06/05 Sabastian"

" ********************SET********************
color inkpot
"color blue molokai solarized darkblue
"se background=dark
se background=light
let &termencoding=&encoding
set fileencodings=utf-8,gbk
set nocompatible
set nu numberwidth=5
set cindent
set ai
set tabstop=2
set shiftwidth=2
set ts=2 sw=2 et "vim-indent set"
set expandtab
set softtabstop=2
set autoindent
set mouse=a
set autochdir
se hlsearch incsearch 
se ruler
set laststatus=2
set cmdheight=2
set nowrap
"set foldmethod=indent
set foldmethod=syntax
"set foldmethod=manual
set nofoldenable
syntax on
syntax enable
filetype plugin indent on

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
nmap <leader>ay ggVG"+y<C-o><C-o>
nmap <leader>q :q<CR>
nmap <leader>xa :xa<CR>
nmap <leader>w :w<CR>
nmap <leader>e :e 
nmap <leader>s :sp<CR>
nmap <leader>v :vs<CR>
nnoremap nw <C-w><C-w>
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>on :only<CR>
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j
let b:comment_leader = '"'
autocmd FileType vim noremap <silent> ,cm 
      \:<C-B>silent <C-E>s/^/<C-R>=escape(
      \b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
autocmd FileType vim noremap <silent> ,cu 
      \:<C-B>silent <C-E>s/^\V<C-R>=escape(
      \b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
nnoremap <Leader>hl :set cursorline!<CR> guibg=#771c1c
nmap <leader>pa %
"在某个单词上加上引号，括号
"nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
"nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>< viw<esc>a><esc>'<i<<esc>lw
"~~~~~~~~~~~~~~~大风歌~~~~~~~~~~~~~~~
vnoremap \ U
inoremap <c-d> <esc>ddi
inoremap <c-u> <esc>veU
inoremap <D> <esc>
imap <S-CR> <CR><CR>end<Esc>-cc
"括号,引号自动补全
inoremap ( ()<esc>i
inoremap ) <c-r>=ClosePair(')')<cr>
inoremap { {}<esc>i
inoremap } <c-r>=ClosePair('}')<cr>
inoremap [ []<esc>i
inoremap ] <c-r>=ClosePair(']')<cr> 
inoremap " ""<esc>i
inoremap ' ''<esc>i
onoremap p i(
onoremap b /return<cr>

function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
endf

" ********************OTHER********************
iabbrev @@ Copyright 2016 Sabastian(liuxueyang.github.io),
      \ all rights reserved.
"iabbrev ccopy Copyright 2015 Xueyang Liu, all rights reserved.
"autocmd BufWritePre *.html :normal gg=G

"pathogen{
execute pathogen#infect()
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
runtime bundle/vim-pathogen/autoload/pathogen.vim
"}

if has('mac')
  set guifont=Monaco:h19
  "设置ctags命令的位置
  let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

elseif has('unix')
  set guifont=Inconsolata\ 13
else
  "set guifont=Inconsolata\ 13
  set guifont=Hermit\ 13
  let Tlist_Ctags_Cmd='/usr/bin/ctags'  "设置ctags命令的位置
  "let g:C_CFlags  = '-Wall -std=c++11 -g'
endif

"taglist{
		let Tlist_File_Fold_Auto_Close=1
    let Tlist_Show_One_File = 1            "只显示当前文件
          \的taglist，默认是显示多个
    let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一
          \个窗口，则退出vim
    let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
    let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留
          \在taglist窗口
    nnoremap <leader>tl : Tlist<CR>        "设置关闭和打开taglist窗
          \口的快捷键
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
""map <leader>r :w<CR>:!python3 %<CR>

nmap <Leader>we <Plug>VimwikiSplitLink
nmap <Leader>wq <Plug>VimwikiVSplitLink
":nmap <Leader>wt <Plug>VimwikiTabnewLink
let NERDTreeWinSize=22

"cvim customization"
"fix <bits/stdc++.h> not found in Mac OS X"
"Maybe I should add a if-else clause to get the OS type."
"TODO: configure this for Linux"
let g:C_CFlags='--std=c++1y -Wall'
let g:C_CplusCompiler='/usr/local/bin/g++-5'
""let g:C_VimCompilerName='/usr/bin/g++'
let g:C_ExeExtension = '.exe'

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline
        \(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')
          \[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],
          \'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',
          \ position),'ce',line('.'))
  endif
endfunction

"set cursorline
"set cursorcolumn

"
"added 2014/11/04
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ 
      \[ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ 
      \[%p%%]\ [LEN=%L]
set laststatus=2
hi LineNr ctermfg=101 ctermbg=16 term=none

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"vim-indent-guides"
let g:indent_guides_auto_colors = 1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
""autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd 
      \ guibg=red   ctermbg=3
""autocmd VimEnter,Colorscheme * :hi IndentGuidesEven 
      \ guibg=green ctermbg=4
""hi IndentGuidesOdd  guibg=white   ctermbg=3
""hi IndentGuidesEven guibg=lightgrey ctermbg=4
nmap <silent> <leader>i <Plug>IndentGuidesToggle

nmap <leader>ch :A<CR>
nmap <leader>sch :AS<CR>

"vim-signature"

let g:SignatureMap = {
  \ 'Leader'	     :  "m",
  \ 'PlaceNextMark'      :  "m,",
  \ 'ToggleMarkAtLine'   :  "m.",
  \ 'PurgeMarksAtLine'   :  "m-",
  \ 'DeleteMark'	 :  "dm",
  \ 'PurgeMarks'	 :  "mda",
  \ 'PurgeMarkers'       :  "m<BS>",
  \ 'GotoNextLineAlpha'  :  "']",
  \ 'GotoPrevLineAlpha'  :  "'[",
  \ 'GotoNextSpotAlpha'  :  "`]",
  \ 'GotoPrevSpotAlpha'  :  "`[",
  \ 'GotoNextLineByPos'  :  "]'",
  \ 'GotoPrevLineByPos'  :  "['",
  \ 'GotoNextSpotByPos'  :  "mn",
  \ 'GotoPrevSpotByPos'  :  "mp",
  \ 'GotoNextMarker'     :  "[+",
  \ 'GotoPrevMarker'     :  "[-",
  \ 'GotoNextMarkerAny'  :  "]=",
  \ 'GotoPrevMarkerAny'  :  "[=",
  \ 'ListLocalMarks'     :  "ms",
  \ 'ListLocalMarkers'   :  "m?"
  \ }

:let did_install_default_menus = 1
"hi CursorLine ctermbg=white ctermfg=black
"hi CursorColumn ctermbg=white ctermfg=black

"let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/',
"\ 'path_html': '~/Dropbox/vimwiki_html/',
"\ 'template_path': '~/Dropbox/vimwiki_template/',
"\ 'template_default': 'def_template',
"\ 'template_ext': '.html'}]

let g:vimwiki_list = [{'path': '~/Blog/vimwiki/',
\ 'path_html': '~/Blog/vimwiki_html/',
\ 'template_path': '~/Blog/vimwiki_template/',
\ 'template_default': 'def_template',
\ 'template_ext': '.html'}]

let g:vimwiki_camel_case = 0
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_CJK_length = 1
let g:vimwiki_valid_html_tags=
      \ 'b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
map <S-F4> :VimwikiAll2HTML<cr>
map <F4> :Vimwiki2HTML<cr>


:hi VimwikiHeader1 guifg=#FF0000
:hi VimwikiHeader2 guifg=#00FF00
:hi VimwikiHeader3 guifg=#0000FF
:hi VimwikiHeader4 guifg=#FF00FF
:hi VimwikiHeader5 guifg=#00FFFF
:hi VimwikiHeader6 guifg=#FFFF00

"vim-clang-format"
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf
      \ :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf
      \ :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x 
      \ <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
au FileType c ClangFormatAutoEnable
nmap <Leader>fm :ClangFormat<CR>

let g:Powerline_symbols = 'fancy'

"Recognize modeline # vim: filetype=perl6
set ml

"check for a local vimrc
if filereadable("~/vim/vimrc")
  so ~/.vim/vimrc
endif

"check for Perl 6 code
function! LooksLikePerl6 ()
  if getline(1) =~# '^#!.*/bin/.*perl6'
    set filetype=perl6
  else
    for i in [1,2,3,4,5]
      if getline(i) == 'use v6;'
        set filetype=perl6
        break
      endif
    endfor
  endif
endfunction

au bufRead *.pm,*.t,*.pl6 call LooksLikePerl6()

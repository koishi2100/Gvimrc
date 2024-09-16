
"----------------------设置------------------------

set ts=4				"设置tab缩进4格
set shiftwidth=4		"设置>>缩进4格
set smarttab 			"在行和段开始处使用制表符
set smartindent			"智能缩进
"set expandtab			"tab转空格缩进
set cindent 			"针对C语言语法自动缩进
set autoindent			"设置自动缩进
set history=1000		"最大历史记录
set autowriteall		"文件自动保存
set autoread			"文件自动加载

set encoding=gbk		"新建文件格式
let termencoding=&encoding
set fileencodings=gbk,UTF-8  "gbk编码(cp936)
language messages gbk


"修改交换。备份文件位置
:set directory=C:\Users\21003\Documents\vimswapfiles\swap
:set undodir=C:\Users\21003\Documents\vimswapfiles\undo
:set backupdir=C:\Users\21003\Documents\vimswapfiles\backup


source D:\gvim\Vim\vim91\acm\acm.vim   "自定义c++模版配置



"------------------外观配置---------------------

set guifont=Hack:h15		"设置字体
color desert				"设置主题配色
set lines=35 columns=100	"启动时窗口大小设置
winpos 300 200				"设定启动时窗口位置
set vb t_vb=				"去掉错误提示音
set noerrorbells			"去掉错误提示音
au GuiEnter * set t_vb=		"关闭闪屏
set shortmess=atI  		 	"启动的时候不显示那个援助乌干达儿童的提示
set go=             		"关闭图形按钮  
set guioptions-=T           "隐藏工具栏
"set guioptions-=m           "隐藏菜单栏
set showtabline=1       	"0关闭标签页，1至少打开2个标签页时才显示，2总是显示
"set number					"设置代码行号显示set nu
"set relativenumber			"显示相对行号set rnu
set numberwidth=1 			"设定行号宽度
set nowrap					"关闭长行自动换行
set cul						"高亮光标所在行
"set cuc 					"高亮光标所在列
set guicursor=i:hor20		"设置insert模式下光标样式
"set guicursor=n:hor20		"设置normal模式下光标样式
set guioptions+=r			"设置滚动条,-=关闭,+=开启，l左，r右，b底部


"------------------按键映射----------------------
  

imap jk <ESC>	
	"插入模式下		jk映射为Esc  
	"Ctrl+h/j/k/l映射为上下左右移动光标		
imap <C-h> <left>
imap <C-j> <down>
imap <C-k> <up>
imap <C-l> <right>

imap <C-f> <BS>
imap <C-i> <BS>
imap <C-g> <BS>
imap <C-;> <Right>

nmap <space> :
	"普通入模式下		<space>映射为:
	"C+h/j/k/l窗口切换
nmap <C-h> <C-w>h		
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

nmap <C-a> ggVG"+y<Esc>
"Ctrl+a 全选复制到系统剪切板

nmap <S-j> 5j
nmap <S-k> 5k

"smart indent when entering insert mode with i on empty lines 
"function! IndentWithI() 
"	if len(getline('.')) == 0 
"		return "cc" 
"	else
"		return "i" 
"	endif 
"endfunction 
"nnoremap <expr> i IndentWithI()




"cmap ;a <C-[>			
	"命令模式下  	;a映射为Esc

vmap <space> <Esc>	
	"可视模式下		<space>映射为Esc

set timeoutlen=1000  "设定连续按键延迟为1000ms
"set winaltkeys=no		"设置Alt键不映射到菜单栏



"-----------------插件----------------------

"plug插件

call plug#begin('D:\gvim\Vim\vim91\plugged')

" List your plugins here   指令:PlugInstall安装插件    :PlugStatus查看状态    :PlugUpdate更新插件

Plug 'w0rp/ale'   							"语法检查
Plug 'junegunn/seoul256.vim'				"seoul主题

Plug 'vim-airline/vim-airline'       	 	"air-line标签
Plug 'vim-airline/vim-airline-themes'		"air-line主题
Plug 'scrooloose/nerdtree'					"目录树
Plug 'luochen1990/rainbow'					"彩虹括号
"Plug 'octol/vim-cpp-enhanced-highlight'	"增强高亮
"Plug 'preservim/nerdcommenter'				"快速注释


"Plug 'neoclide/coc.nvim', {'branch': 'release'}	"coc.nvim
"Plug 'itchyny/vim-cursorword'				"单词下划线
"Plug 'crusoexia/vim-monokai'				"monokai主题
"Plug 'jiangmiao/auto-pairs'				"智能括号
"Plug 'yggdroot/indentline'					"竖对齐线 需要空格缩进
"Plug 'ryanoasis/vim-devicons'				"文件图标 需要utf-8和特定字体支持

call plug#end()




"nerdtree配置   F3映射为打开文件目录
"说明：
"o打开  t/(T)在新标签页(静默)打开   p返回到文件目录  P返回到根目录 
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小



"ale插件配置
let g:ale_set_highlights = 1		"错误高亮
"let g:ale_lint_on_text_changed = 'never'   "never文件内容发生变化时不进行检查
let g:ale_lint_on_enter = 0     "打开文件时不进行检查
let g:ale_sign_error = 'x'		"error类型警告替换为>
let g:ale_sign_warning = '-'   "waring类型警告替换为-
let g:ale_set_signs = 0		"左栏柱状提示
let g:airline#extensions#ale#enabled = 1	"配合airline显示错误提示
"let g:ale_enabled = 0			"禁用ale
let g:ale_lint_delay = 500  	"500毫秒
"let g:ale_cpp_gcc_options = '-O2 -std=c++17'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_insert_leave = 0   "离开insert模式时不进行检查
let g:ale_virtualtext_cursor = 0	"关闭注释



"airline配置
let g:airline#extensions#tabline#enabled = 0	"启用顶部tabline标签页
"设置状态栏
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'unique_tail' 
let g:airline_theme = 'solarized'  "设置主题
let g:airline_solarized_bg='light'



"nerdcommenter插件配置
"说明：
",cc 	注释	注释到光标位置
",cu 	取消注释	
",cs  	以”性感”的方式注释	  注释到光标所在位置行首
"5,cs   以”性感”的方式注释光标开始5行
let mapleader=","		"注释按键改为,
 
"设置不同语言注释风格
let g:NERDCustomDelimiters = { 'php': { 'left': '/*','right': '*/' },'html': { 'left': '<!--','right': '-->' },'py': { 'left': '#' },'sh': { 'left': '#' },'cpp':{'left':'//'},'c':{'left':'//'}}


"coc.nvim配置
"使用tab和Shift+tab补全
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



"monokai 配置
"colo monokai  "使用monokai配色


"rainbow配置
let g:rainbow_active = 1



"seoul主题
colo seoul256	"使用seoul256主题，default:dark
let g:seoul256_background = 236
"colo seoul256-light
"set background=dark
"set background=light


"indentline配置,需要空格缩进
":set list lcs=tab:\|\ 
"let g:indentLine_char_list = ['|', '|', '┆', '┊']
"let g:indentLine_enabled = 0			" 使插件生效
"let g:indentLine_char = '|'			" 设置缩进线字符，也可以为 '|', '┆', '┊' 等
"let g:indentLine_conceallevel = 2 		" 使插件正常运行


"AutoPairs配置
let g:AutoPairsMapCh = 0	"<C-H>删除括号对
let g:AutoPairsMapSpace = 0 "<space>在两侧添加空格
let g:AutoPairs = {'(':')', '[':']', '{':'}'}	"设置要配对的括号




"---------------编译配置------------------
" 禁用数字键和 <F-n> 的组合  
map 1<F5> 1<F5>
map 2<F5> 1<F5>
map 3<F5> 1<F5>
map 4<F5> 1<F5>
map 5<F5> 1<F5>
map 6<F5> 1<F5>
map 7<F5> 1<F5>
map 8<F5> 1<F5>
map 9<F5> 1<F5>

map 1<F6> 1<F6>
map 2<F6> 1<F6>
map 3<F6> 1<F6>
map 4<F6> 1<F6>
map 5<F6> 1<F6>
map 6<F6> 1<F6>
map 7<F6> 1<F6>
map 8<F6> 1<F6>
map 9<F6> 1<F6>

map 1<C-F6> 1<C-F6>
map 2<C-F6> 1<C-F6>
map 3<C-F6> 1<C-F6>
map 4<C-F6> 1<C-F6>
map 5<C-F6> 1<C-F6>
map 6<C-F6> 1<C-F6>
map 7<C-F6> 1<C-F6>
map 8<C-F6> 1<C-F6>
map 9<C-F6> 1<C-F6>


"F5 编译
"编译参数 
"-o <文件名> 	指定生成文件名
"-O1 -O2 -O3   	优化级别
"-g 	在编译时添加调试信息  使用gdb调试时需要
"-Wall	显示所有编译警告信息
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"

    if &filetype == 'c'
        exec "!g++ % -o %<" 
    elseif &filetype == 'cpp'

		exec "silent !g++ % -o %< -O2 && exit || pause"

		if(FileIsOpen('in.txt') == 0||FileIsOpen('out.txt') == 0)
			exec "only"
			belowright vsplit in.txt
			exec "silent vertical resize 21"
			belowright sview out.txt
			exec "silent wincmd h"
		endif

		exec "redraw!"
		echo "Finished!"
	endif
endfunc


"F6 运行文件
map <F6> :call RunGcc()<CR>
func! RunGcc()
    exec "w"
    if &filetype == 'cpp'
        exec "! %<" 
		exec "redraw"
    endif
endfunc


"Ctrl+F6运行并读入in.txt
map <C-F6> :call InputandRun()<CR>
func! InputandRun()
	exec "w"

	if &filetype == 'cpp'
		exec "! %< < in.txt > out.txt | type out.txt"
		if(FileIsOpen('in.txt') == 0 || FileIsOpen('out.txt') == 0)
			exec "only"
			belowright vsplit in.txt
			exec "vertical resize 21"
			belowright sview out.txt
		endif
		wincmd t
		redraw!
	elseif (expand('%') == 'in.txt' || expand('%') == 'out.txt')
		exec "silent wincmd h"
		:call InputandRun()
	endif
endfunc


"函数：判断'文件'是否打开
function! FileIsOpen(file)
  let bufnr = bufnr(a:file)
  if bufnr != -1 && bufwinid(bufnr) != -1
    return 1
  else
    return 0
  endif
endfunction


"F8 gdb调试
"map <F8> :call Rungdb()<CR>
"
"func! Rungdb()
"    exec "w"
"    exec "!g++ % -g -o %<"
"    exec "!gdb %<"
"endfunc

"将复制内容覆写入in.txt
nmap <C-p> :call CtrlP()<CR>
function! CtrlP()
	if expand('%') == 'in.txt'
		%d
		exec "normal! \"+P"
		w
		wincmd h
	else
		exec "normal \"+p"
	endif
endfunction



"-------------------其他配置-------------------
"自动补全括号
:inoremap ( ()<Left>
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<Left>
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<Left>
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<Left>
":inoremap ' ''<Left>

"函数：右括号覆盖
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

"函数：括号配对删除
imap <BS> <c-r>=UuzDeleteBrackets()<CR>
function! UuzDeleteBrackets()
	let col = col('.') - 1
	let line = getline('.')
	if col > 0 && col < len(line) && ((line[col - 1] == '(' && line[col] == ')') ||(line[col - 1] == '{' && line[col] == '}') || (line[col - 1] == '[' && line[col] == ']'))
		return "\<Del>\<BS>"
	else 
		return "\<BS>"
	endif
endfunction




"函数：花括号回车自动换行
imap <CR> <c-r>=UuzBrackets('}')<CR>
imap <S-CR> <c-r>=UuzBrackets('}')<CR>
function! UuzBrackets(char)
	if getline('.')[col('.') - 1] == a:char
		let col = col('.') - 1
		let line = getline('.')
		if(stridx(line,'{')) != -1
			return "\<CR>\<ESC>\%a\<CR>"
		else
			return "\<CR>"
		endif
	else 
		return "\<CR>"
	endif
endfunction





" Vim with all enhancements

source $VIMRUNTIME/vimrc_example.vim
"以下配置写在source下s
set noswapfile         "关闭生成.swp文件
"set nobackup			"关闭生成备份文件
"set noundofile			"关闭生成.un文件

set vb t_vb=
set laststatus=1


"设置gui语言为英文
"set langmenu=en_US
"let $LANG = 'en_US'
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim



" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

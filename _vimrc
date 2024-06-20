
"----------------------设定-------------------------

set guifont=黑体:h20   "设置字体为黑体 18号
set ts=4				"设置tab缩进4格
set shiftwidth=4		"设置>>缩进4格
set smarttab 			"在行和段开始处使用制表符
set cindent 			"针对C语言语法自动缩进
set autoindent			"设置自动缩进
"set number				"设置代码行号显示
 

let &termencoding=&encoding
set fileencodings=cp936 		 "gbk编码(cp936)
language messages UTF-8
let $LANG = 'en_US.UTF-8'

"behave mswin
"set noswapfile         "不生成交换文件.swp
"set nobackup			"不生成备份文件
"set noundofile			"不生成.un~文件(修改文件后重新编辑时也能实现之前步骤的undo功能)


"color morning				"设置主题配色
set lines=30 columns=80		"启动时窗口大小设置
winpos 300 200				"设定窗口位置
set vb t_vb=				"去掉错误提示音
au GuiEnter * set t_vb=		"关闭闪屏
set shortmess=atI  		 	" 启动的时候不显示那个援助乌干达儿童的提示
"set go=             		" 关闭图形按钮  
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set showtabline=1       	"0关闭标签页，1至少打开2个标签页时才显示，2总是显示


source D:\gvim\Vim\vim91\acm\acm.vim   "自定义c++模版配置



"------------------按键映射----------------------
  

imap jk <C-[>			
	"插入模式下		jk映射为Esc  
	"Ctrl+h/j/k/l映射为上下左右移动光标
imap <C-h> <left>
imap <C-j> <down>
imap <C-k> <up>
imap <C-l> <right>


    
nmap <space> :
	"普通入模式下		<space>映射为:
	"C+h/j/k/l窗口切换
nmap <C-h> <C-w>h		
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

"Ctrl+a 全选复制到系统剪切板
nmap <C-a> ggVG"+y<Esc>
nmap <C-p> "+p:w<Esc><C-h>

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



Plug 'octol/vim-cpp-enhanced-highlight'		"增强高亮
Plug 'scrooloose/nerdtree'					"目录树
Plug 'w0rp/ale'   							"语法检查
Plug 'vim-airline/vim-airline'       	 	"air-line标签
Plug 'vim-airline/vim-airline-themes'		"air-line主题
Plug 'itchyny/vim-cursorword'				"单词下划线
"Plug 'ryanoasis/vim-devicons'				"文件图标
Plug 'preservim/nerdcommenter'				"快速注释
Plug 'neoclide/coc.nvim', {'branch': 'release'}	"coc.nvim
Plug 'crusoexia/vim-monokai'				"主题
Plug 'luochen1990/rainbow'					"彩虹括号


call plug#end()






"nerdtree配置   F3映射为打开文件目录
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小



"ale插件配置
let g:ale_set_highlights = 1		"错误高亮
"let g:ale_lint_on_text_changed = 'never'   "never文件内容发生变化时不进行检查
let g:ale_lint_on_enter = 0     "打开文件时不进行检查
let g:ale_sign_error = '>'		"error类型警告替换为>
let g:ale_sign_warning = '-'   "waring类型警告替换为-
let g:ale_set_signs = 0		"左栏柱状提示
let g:airline#extensions#ale#enabled = 1	"配合airline显示错误提示
"let g:ale_enabled = 0			"禁用ale





"airline配置
let g:airline#extensions#tabline#enabled = 1	"启用顶部tabline标签页
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'desertink'  " 主题



"nerdcommenter插件配置
",cc 	注释	注释到光标位置
",cu 	取消注释	
",cs  	以”性感”的方式注释	  注释到光标所在位置行首
"5,cs   以”性感”的方式注释光标开始5行
let mapleader=","		"注释按键改为,
 
let g:NERDCustomDelimiters = { 'php': { 'left': '/*','right': '*/' },'html': { 'left': '<!--','right': '-->' },'py': { 'left': '#' },'sh': { 'left': '#' },'cpp':{'left':'//'},'c':{'left':'//'}}


"coc.nvim配置
"使用tab和S+tab补全
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



"monokai 配置
colo monokai  "使用monokai配色


"rainbow配置
let g:rainbow_active = 1


"---------------编译配置------------------



"F5保存,编译(并运行文件)
map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<" 
        "exec "! %<"  "运行文件
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        "exec "! %<"   "运行文件
    elseif &filetype == 'java' 
        exec "!javac %" 
        "exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
	"分屏打开in和out窗口
	"exec "only"
	if(FileIsOpen('in.txt') == 0)
		belowright vsplit in.txt
		exec "vertical resize 10"
    	belowright sview out.txt
		"exec "set readonly"
		exec "wincmd h"
	endif
endfunc


"F6 运行文件
map <F6> :call RunGcc()<CR>

func! RunGcc()
    exec "w"
    if &filetype == 'c'
        "exec "!g++ % -o %<" 
        exec "! %<"  
    elseif &filetype == 'cpp'
        "exec "!g++ % -o %<" 
        exec "! %<" 
    elseif &filetype == 'java' 
       " exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc


"Ctrl+F6运行并读入in.txt
map <C-F6> :call InputandRun()<CR>

func! InputandRun()
	exec "w"

	exec "! %< < in.txt > out.txt | type out.txt"

	"分屏打开in和out窗口
	exec "only"
	if(FileIsOpen('in.txt') == 0)
		belowright vsplit in.txt
		exec "vertical resize 10"
    	belowright sview out.txt
		exec "set readonly"
	endif
    wincmd t
    redraw!
endfunc


"判断'文件'是否打开
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





"自动补全括号
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction











" Vim with all enhancements

source $VIMRUNTIME/vimrc_example.vim

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


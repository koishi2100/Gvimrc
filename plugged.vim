"-----------------插件----------------------

"plug插件

silent! call plug#begin('$VIMRUNTIME/plugged')

" List your plugins here   指令:PlugInstall安装插件    :PlugStatus查看状态    :PlugUpdate更新插件
" 指令需要配合git使用

Plug 'w0rp/ale'   							"语法检查
Plug 'junegunn/seoul256.vim'				"seoul主题

Plug 'vim-airline/vim-airline'       	 	"air-line标签
Plug 'vim-airline/vim-airline-themes'		"air-line主题
Plug 'scrooloose/nerdtree'					"目录树
Plug 'luochen1990/rainbow'					"彩虹括号
Plug 'octol/vim-cpp-enhanced-highlight'		"增强高亮
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
"o打开  t/(T)在tab(静默)打开   p返回到文件目录  P返回到根目录 
"i/s水平/垂直分割窗口打开
"g + o/i/s  打开但光标仍然停留不动
"x/X 收起当前/所有目录
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小



"ale插件配置
let g:ale_set_highlights = 1		"错误高亮
"let g:ale_lint_on_text_changed = 'never'   "never文件内容发生变化时不进行检查
let g:ale_lint_on_enter = 0     "打开文件时不进行检查
"let g:ale_enabled = 0			"禁用ale
let g:ale_lint_delay = 50  		"检查延迟(毫秒)
let g:ale_lint_on_insert_leave = 0  	"离开insert模式时不进行检查
let g:ale_virtualtext_cursor = 0		"关闭注释
let g:airline#extensions#whitespace#enabled = 0	"关闭尾随空格检查
let g:airline#extensions#ale#enabled = 0	"配合airline显示错误/警告统计
let g:ale_set_signs = 0			"左栏柱状提示
let g:ale_sign_error = 'x'		"error类型警告替换为>
let g:ale_sign_warning = '.'   	"waring类型警告替换为-





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
"let g:seoul256_background = 236
"colo seoul256-light
"set background=dark
"set background=light

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237

" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253



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


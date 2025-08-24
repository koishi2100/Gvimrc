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


"Plug 'jiangmiao/auto-pairs'				"智能括号

call plug#end()




"nerdtree配置   F3映射为打开文件目录
"说明：
"o打开  t/(T)在tab(静默)打开   p返回到文件目录  P返回到根目录 
"i/s水平/垂直分割窗口打开
"g + o/i/s  打开但光标仍然停留不动
"x/X 收起当前/所有目录
map <silent> <F3> :NERDTreeMirror<CR>
map <silent> <F3> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小



"ale插件配置
let g:ale_set_highlights = 1			"错误高亮
let g:ale_cpp_cc_options='-O2 -w'
"let g:ale_lint_on_text_changed = 'never'   "never文件内容发生变化时不进行检查
let g:ale_lint_on_enter = 1				"打开文件时进行检查
"let g:ale_enabled = 0					"禁用ale
let g:ale_lint_delay = 50  				"检查延迟(毫秒)
let g:ale_lint_on_insert_leave = 0  	"离开insert模式时进行检查
let g:ale_virtualtext_cursor = 0		"报错注释
let g:ale_virtualtext_prefix = '//'		"替换注释前缀
let g:airline#extensions#whitespace#enabled = 0	"关闭尾随空格检查
let g:airline#extensions#ale#enabled = 0	"配合airline显示错误/警告统计
let g:ale_set_signs = 0					"左栏柱状提示
let g:ale_sign_error = 'x'				"error类型警告替换为x
"let g:ale_sign_warning = '-'   		"waring类型警告替换为- 已经在ale/autoload/ale/sign.vim中被替换为空



"airline配置
let g:airline#extensions#tabline#enabled = 0	"启用顶部tabline标签页
"设置状态栏
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'unique_tail' 
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='light'

"状态栏显示内容配置
"let g:airline_section_a = ''  " 模式
"let g:airline_section_b = ''  " Git分支
"let g:airline_section_c = ''  " 文件名
let g:airline_section_x = ''  " 文件类型
let g:airline_section_y = '%{&fenc}'  " 文件编码
"let g:airline_section_z = ''  " 百分比 行:列

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.readonly = '[RO]' "只读符号


"nerdcommenter插件配置
"说明：
",cc 	注释	注释到光标位置
",cu 	取消注释	
",cs  	以”性感”的方式注释	  注释到光标所在位置行首
"5,cs   以”性感”的方式注释光标开始5行
let mapleader=","		"注释按键改为,
 
"设置不同语言注释风格
let g:NERDCustomDelimiters = { 'py': { 'left': '#' },'cpp':{'left':'//'},'c':{'left':'//'}}


"rainbow配置
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['white', 'darkorange1', 'seagreen1', '#179fff','#ffd700'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\		'nerdtree': 0, 
\	}
\}





"seoul主题
silent! colo seoul256	"使用seoul256主题，default:dark
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


"AutoPairs配置
let g:AutoPairsMapCh = 0	"<C-H>删除括号对
let g:AutoPairsMapSpace = 0 "<space>在两侧添加空格
let g:AutoPairs = {'(':')', '[':']', '{':'}'}	"设置要配对的括号


"-----------------���----------------------

"plug���

silent! call plug#begin('$VIMRUNTIME/plugged')

" List your plugins here   ָ��:PlugInstall��װ���    :PlugStatus�鿴״̬    :PlugUpdate���²��
" ָ����Ҫ���gitʹ��

Plug 'w0rp/ale'   							"�﷨���
Plug 'junegunn/seoul256.vim'				"seoul����
Plug 'vim-airline/vim-airline'       	 	"air-line��ǩ
Plug 'vim-airline/vim-airline-themes'		"air-line����
Plug 'scrooloose/nerdtree'					"Ŀ¼��

Plug 'luochen1990/rainbow'					"�ʺ�����
Plug 'octol/vim-cpp-enhanced-highlight'		"��ǿ����


"Plug 'preservim/nerdcommenter'				"����ע��
"Plug 'neoclide/coc.nvim', {'branch': 'release'}	"coc.nvim


"Plug 'jiangmiao/auto-pairs'				"��������

call plug#end()




"nerdtree����   F3ӳ��Ϊ���ļ�Ŀ¼
"˵����
"o��  t/(T)��tab(��Ĭ)��   p���ص��ļ�Ŀ¼  P���ص���Ŀ¼ 
"i/sˮƽ/��ֱ�ָ�ڴ�
"g + o/i/s  �򿪵������Ȼͣ������
"x/X ����ǰ/����Ŀ¼
map <silent> <F3> :NERDTreeMirror<CR>
map <silent> <F3> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25 "�趨 NERDTree �Ӵ���С



"ale�������
let g:ale_set_highlights = 1			"�������
let g:ale_cpp_cc_options='-O2 -w'
"let g:ale_lint_on_text_changed = 'never'   "never�ļ����ݷ����仯ʱ�����м��
let g:ale_lint_on_enter = 1				"���ļ�ʱ���м��
"let g:ale_enabled = 0					"����ale
let g:ale_lint_delay = 50  				"����ӳ�(����)
let g:ale_lint_on_insert_leave = 0  	"�뿪insertģʽʱ���м��
let g:ale_virtualtext_cursor = 0		"����ע��
let g:ale_virtualtext_prefix = '//'		"�滻ע��ǰ׺
let g:airline#extensions#whitespace#enabled = 0	"�ر�β��ո���
let g:airline#extensions#ale#enabled = 0	"���airline��ʾ����/����ͳ��
let g:ale_set_signs = 0					"������״��ʾ
let g:ale_sign_error = 'x'				"error���;����滻Ϊx
"let g:ale_sign_warning = '-'   		"waring���;����滻Ϊ- �Ѿ���ale/autoload/ale/sign.vim�б��滻Ϊ��



"airline����
let g:airline#extensions#tabline#enabled = 0	"���ö���tabline��ǩҳ
"����״̬��
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'unique_tail' 
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='light'

"״̬����ʾ��������
"let g:airline_section_a = ''  " ģʽ
"let g:airline_section_b = ''  " Git��֧
"let g:airline_section_c = ''  " �ļ���
let g:airline_section_x = ''  " �ļ�����
let g:airline_section_y = '%{&fenc}'  " �ļ�����
"let g:airline_section_z = ''  " �ٷֱ� ��:��

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.readonly = '[RO]' "ֻ������


"nerdcommenter�������
"˵����
",cc 	ע��	ע�͵����λ��
",cu 	ȡ��ע��	
",cs  	�ԡ��ԸС��ķ�ʽע��	  ע�͵��������λ������
"5,cs   �ԡ��ԸС��ķ�ʽע�͹�꿪ʼ5��
let mapleader=","		"ע�Ͱ�����Ϊ,
 
"���ò�ͬ����ע�ͷ��
let g:NERDCustomDelimiters = { 'py': { 'left': '#' },'cpp':{'left':'//'},'c':{'left':'//'}}


"rainbow����
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





"seoul����
silent! colo seoul256	"ʹ��seoul256���⣬default:dark
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


"AutoPairs����
let g:AutoPairsMapCh = 0	"<C-H>ɾ�����Ŷ�
let g:AutoPairsMapSpace = 0 "<space>��������ӿո�
let g:AutoPairs = {'(':')', '[':']', '{':'}'}	"����Ҫ��Ե�����


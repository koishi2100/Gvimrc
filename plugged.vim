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


"Plug 'itchyny/vim-cursorword'				"�����»���
"Plug 'crusoexia/vim-monokai'				"monokai����
"Plug 'jiangmiao/auto-pairs'				"��������
"Plug 'yggdroot/indentline'					"�������� ��Ҫ�ո�����
"Plug 'ryanoasis/vim-devicons'				"�ļ�ͼ�� ��Ҫutf-8���ض�����֧��

call plug#end()




"nerdtree����   F3ӳ��Ϊ���ļ�Ŀ¼
"˵����
"o��  t/(T)��tab(��Ĭ)��   p���ص��ļ�Ŀ¼  P���ص���Ŀ¼ 
"i/sˮƽ/��ֱ�ָ�ڴ�
"g + o/i/s  �򿪵������Ȼͣ������
"x/X ����ǰ/����Ŀ¼
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25 "�趨 NERDTree �Ӵ���С



"ale�������
let g:ale_set_highlights = 1		"�������
"let g:ale_lint_on_text_changed = 'never'   "never�ļ����ݷ����仯ʱ�����м��
let g:ale_lint_on_enter = 0     "���ļ�ʱ�����м��
"let g:ale_enabled = 0			"����ale
let g:ale_lint_delay = 50  		"����ӳ�(����)
let g:ale_lint_on_insert_leave = 0  	"�뿪insertģʽʱ�����м��
let g:ale_virtualtext_cursor = 0		"�ر�ע��
let g:airline#extensions#whitespace#enabled = 0	"�ر�β��ո���
let g:airline#extensions#ale#enabled = 0	"���airline��ʾ����/����ͳ��
let g:ale_set_signs = 0			"������״��ʾ
let g:ale_sign_error = 'x'		"error���;����滻Ϊ>
let g:ale_sign_warning = '.'   	"waring���;����滻Ϊ-





"airline����
let g:airline#extensions#tabline#enabled = 0	"���ö���tabline��ǩҳ
"����״̬��
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'unique_tail' 
let g:airline_theme = 'solarized'  "��������
let g:airline_solarized_bg='light'



"nerdcommenter�������
"˵����
",cc 	ע��	ע�͵����λ��
",cu 	ȡ��ע��	
",cs  	�ԡ��ԸС��ķ�ʽע��	  ע�͵��������λ������
"5,cs   �ԡ��ԸС��ķ�ʽע�͹�꿪ʼ5��
let mapleader=","		"ע�Ͱ�����Ϊ,
 
"���ò�ͬ����ע�ͷ��
let g:NERDCustomDelimiters = { 'php': { 'left': '/*','right': '*/' },'html': { 'left': '<!--','right': '-->' },'py': { 'left': '#' },'sh': { 'left': '#' },'cpp':{'left':'//'},'c':{'left':'//'}}


"coc.nvim����
"ʹ��tab��Shift+tab��ȫ
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



"monokai ����
"colo monokai  "ʹ��monokai��ɫ


"rainbow����
let g:rainbow_active = 1



"seoul����
colo seoul256	"ʹ��seoul256���⣬default:dark
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



"indentline����,��Ҫ�ո�����
":set list lcs=tab:\|\ 
"let g:indentLine_char_list = ['|', '|', '��', '��']
"let g:indentLine_enabled = 0			" ʹ�����Ч
"let g:indentLine_char = '|'			" �����������ַ���Ҳ����Ϊ '|', '��', '��' ��
"let g:indentLine_conceallevel = 2 		" ʹ�����������


"AutoPairs����
let g:AutoPairsMapCh = 0	"<C-H>ɾ�����Ŷ�
let g:AutoPairsMapSpace = 0 "<space>��������ӿո�
let g:AutoPairs = {'(':')', '[':']', '{':'}'}	"����Ҫ��Ե�����


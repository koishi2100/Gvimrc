"----------------------����------------------------

set ts=4				"����tab����4��
set shiftwidth=4		"����>>����4��
set smarttab 			"���кͶο�ʼ��ʹ���Ʊ��
set smartindent			"��������
"set expandtab			"tabת�ո�����
set cindent 			"���C�����﷨�Զ�����
set autoindent			"�����Զ�����ai
set history=1000		"�����ʷ��¼
set autowriteall		"�ļ��Զ�����
set autoread			"�ļ��Զ�����
set fileformat=unix		"����^M���з�

"set encoding=cp936		"�½��ļ���ʽ
"let &termencoding=&encoding
"set fileencodings=cp936,UTF-8  "gbk����(cp936)
"language messages cp936






"-------------------��������-------------------




"set vb t_vb=
"set laststatus=1


"����gui���� 
set langmenu=en_US
language messages en_US
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


"�޸Ľ���,�����ļ�λ��
:set directory=$VIMRUNTIME/acm/vimswapfiles/swap
:set undodir=$VIMRUNTIME/acm/vimswapfiles/undo
:set backupdir=$VIMRUNTIME/acm/vimswapfiles/backup

source $VIMRUNTIME/vimrc_example.vim
set noswapfile         "�ر�����.swp�ļ�
set nobackup			"�ر����ɱ����ļ�
"set noundofile			"�ر�����.un�ļ�


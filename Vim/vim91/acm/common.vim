"----------------------设置------------------------

set ts=4				"设置tab缩进4格
set shiftwidth=4		"设置>>缩进4格
set smarttab 			"在行和段开始处使用制表符
set smartindent			"智能缩进
"set expandtab			"tab转空格缩进
set cindent 			"针对C语言语法自动缩进
set autoindent			"设置自动缩进ai
set history=1000		"最大历史记录
set autowriteall		"文件自动保存
set autoread			"文件自动加载
set fileformat=unix		"忽略^M换行符

"set encoding=cp936		"新建文件格式
"let &termencoding=&encoding
"set fileencodings=cp936,UTF-8  "gbk编码(cp936)
"language messages cp936






"-------------------其他配置-------------------




"set vb t_vb=
"set laststatus=1


"设置gui语言 
set langmenu=en_US
language messages en_US
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


"修改交换,备份文件位置
:set directory=$VIMRUNTIME/acm/vimswapfiles/swap
:set undodir=$VIMRUNTIME/acm/vimswapfiles/undo
:set backupdir=$VIMRUNTIME/acm/vimswapfiles/backup

source $VIMRUNTIME/vimrc_example.vim
set noswapfile         "关闭生成.swp文件
set nobackup			"关闭生成备份文件
"set noundofile			"关闭生成.un文件


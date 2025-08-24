"------------------外观配置---------------------

set guifont=consolas:h14	"设置字体
syntax on					"语法高亮
"color desert				"设置主题配色
set lines=38 columns=110	"启动时窗口大小设置
winpos 300 200				"设定启动时窗口位置

"set novisualbell			"去掉闪屏
"set noerrorbells			"去掉错误提示音
set vb t_vb=				"去掉错误提示音
au GuiEnter * set t_vb=		"关闭闪屏

set shortmess=atI  		 	"启动的时候不显示那个援助乌干达儿童的提示
set go=             		"关闭图形按钮 set go=Tm 
"set guioptions-=T           "隐藏工具栏
"set guioptions-=m           "隐藏菜单栏
set guioptions+=r			"设置滚动条,-=关闭,+=开启，l左，r右，b底部
set showtabline=1       	"0:关闭标签页，1:至少打开2个标签页时才显示，2:总是显示
"set number					"设置代码行号显示set nu
"set relativenumber			"显示相对行号set rnu
set numberwidth=1 			"设定行号宽度
set nowrap					"关闭长行自动换行
"set cul					"高亮光标所在行
"set cuc 					"高亮光标所在列
set guicursor=i:hor20		"设置insert模式下光标样式
"set guicursor=n:hor20		"设置normal模式下光标样式
"set list lcs=tab:\|\ 		"显示缩进符号


"------------------按键映射----------------------
  

imap jk <ESC>	
	"插入模式下		jk映射为Esc  
	"Ctrl+h/j/k/l映射为上下左右移动光标		
imap <C-h> <left>
imap <C-j> <down>
imap <C-k> <up>
imap <C-l> <right>

imap <C-f> <BS>
"imap <C-i> <BS>
imap <C-g> <BS>
imap <C-x> <Del>
imap <C-;> <Right>
imap <C-z> <C-o>u

imap <S-Backspace> <C-w>

nmap <space> :
	"普通入模式下		<space>映射为:
	"C+h/j/k/l窗口切换
nmap <C-h> <C-w>h		
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k


nmap <C-a> <Esc>ggVG
vmap <C-a> <Esc>ggVG
vmap <C-c> "+y
"Ctrl+a+c 全选复制到系统剪切板

vmap g( s(<Esc>p
vmap g{ s{<Esc>p
vmap g[ s[<Esc>p
vmap g" s""<Left><Esc>p
vmap g' s''<Left><Esc>p


nmap <S-j> 5j
nmap <S-k> 5k




vmap <space> <Esc>	
	"可视模式下		<space>映射为Esc
vmap <C-d> d



set timeoutlen=1000  "设定连续按键延迟为1000ms
"set winaltkeys=no		"设置Alt键不映射到菜单栏


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



"快速行注释
nmap <C-/> <S-v><C-/>
vnoremap <C-/> :call QuickComment()<CR>  
function! QuickComment()  
	if(&filetype == 'cpp' || &filetype == 'c')
		if(getline('.')[0:1] == '//')
			execute "normal! 0\<C-v>\<right>d"
		else 
			execute "normal! \<C-v>^I//\<Esc>"
		endif
	endif
endfunction  








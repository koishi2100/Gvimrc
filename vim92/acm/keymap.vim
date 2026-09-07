"------------------按键映射----------------------

"nore为非递归 <silent>静默执行
imap jk <Esc>
"inoremap <silent> jk <ESC>m`<C-o>
	"插入模式下		jk映射为Esc  
	"Ctrl+h/j/k/l映射为上下左右移动光标		
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

inoremap <S-Backspace> <C-w>

nnoremap <space> :
	"普通入模式下		<space>映射为:
	"C+h/j/k/l窗口切换
nnoremap <C-h> <C-w>h		
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k


nnoremap <C-a> <Esc>ggVG
vnoremap <C-a> <Esc>ggVG
vnoremap <C-c> "+y
"Ctrl+a+c 全选复制到系统剪切板
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>

nnoremap <S-j> 5j
nnoremap <S-k> 5k




vnoremap <space> <Esc>	
	"可视模式下		<space>映射为Esc

vnoremap <S-j> 5j
vnoremap <S-k> 5k
vnoremap <C-j> J



set timeoutlen=500  "设定连续按键延迟为500ms
"set winaltkeys=no		"设置Alt键不映射到菜单栏


"自动补全括号
:inoremap <silent> ( ()<Left>
:inoremap <silent> ) <c-r>=ClosePair(')')<CR>
:inoremap <silent> { {}<Left>
:inoremap <silent> } <c-r>=ClosePair('}')<CR>
:inoremap <silent> [ []<Left>
:inoremap <silent> ] <c-r>=ClosePair(']')<CR>
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
inoremap <silent> <BS> <c-r>=UuzDeleteBrackets()<CR>
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
inoremap <silent> <CR> <c-r>=UuzBrackets('}')<CR>
inoremap <silent> <S-CR> <c-r>=UuzBrackets('}')<CR>
function! UuzBrackets(char)
	if getline('.')[col('.') - 1] == a:char
		let col = col('.') - 1
		let line = getline('.')
		if(stridx(line,'{')) != -1
			return "\<CR>\<ESC>%a\<CR>"
		else
			return "\<CR>"
		endif
	else 
		return "\<CR>"
	endif
endfunction




"快速为选中变量添加括号
vnoremap g( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap g[ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap g{ <Esc>`>a}<Esc>`<i{<Esc>
vnoremap g" <Esc>`>a"<Esc>`<i"<Esc>
vnoremap g' <Esc>`>a'<Esc>`<i'<Esc>




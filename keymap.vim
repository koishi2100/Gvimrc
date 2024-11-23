"------------------����ӳ��----------------------
  

imap jk <ESC>	
	"����ģʽ��		jkӳ��ΪEsc  
	"Ctrl+h/j/k/lӳ��Ϊ���������ƶ����		
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
	"��ͨ��ģʽ��		<space>ӳ��Ϊ:
	"C+h/j/k/l�����л�
nmap <C-h> <C-w>h		
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k


nmap <C-a> <Esc>ggVG
vmap <C-a> <Esc>ggVG
vmap <C-c> "+y
"Ctrl+a+c ȫѡ���Ƶ�ϵͳ���а�

vmap g( s(<Esc>p
vmap g{ s{<Esc>p
vmap g[ s[<Esc>p
vmap g" s""<Left><Esc>p
vmap g' s''<Left><Esc>p


nmap <S-j> 5j
nmap <S-k> 5k




vmap <space> <Esc>	
	"����ģʽ��		<space>ӳ��ΪEsc
vmap <C-d> d



set timeoutlen=1000  "�趨���������ӳ�Ϊ1000ms
"set winaltkeys=no		"����Alt����ӳ�䵽�˵���


"�Զ���ȫ����
:inoremap ( ()<Left>
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<Left>
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<Left>
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<Left>
":inoremap ' ''<Left>

"�����������Ÿ���
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

"�������������ɾ��
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




"�����������Żس��Զ�����
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



"������ע��
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








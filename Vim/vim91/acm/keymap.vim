"------------------����ӳ��----------------------
  
"noreΪ�ǵݹ� <silent>��Ĭִ��
imap <silent> jk <ESC>m`<C-o>
	"����ģʽ��		jkӳ��ΪEsc  
	"Ctrl+h/j/k/lӳ��Ϊ���������ƶ����		
imap <C-h> <left>
imap <C-j> <down>
imap <C-k> <up>
imap <C-l> <right>

imap <C-f> <BS>
imap <C-g> <BS>
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
cmap <C-h> <left>
cmap <C-j> <down>
cmap <C-k> <up>
cmap <C-l> <right>

nmap <S-j> 5j
nmap <S-k> 5k




vmap <space> <Esc>	
	"����ģʽ��		<space>ӳ��ΪEsc
vmap <C-d> d



set timeoutlen=1000  "�趨���������ӳ�Ϊ1000ms
"set winaltkeys=no		"����Alt����ӳ�䵽�˵���


"�Զ���ȫ����
:inoremap <silent> ( ()<Left>
:inoremap <silent> ) <c-r>=ClosePair(')')<CR>
:inoremap <silent> { {}<Left>
:inoremap <silent> } <c-r>=ClosePair('}')<CR>
:inoremap <silent> [ []<Left>
:inoremap <silent> ] <c-r>=ClosePair(']')<CR>
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




"�����������Żس��Զ�����
inoremap <silent> <CR> <c-r>=UuzBrackets('}')<CR>
inoremap <silent> <S-CR> <c-r>=UuzBrackets('}')<CR>
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




"����Ϊ�����������(��bug����)
vmap g( s(<Esc>p
vmap g{ s{<Esc>p
vmap g[ s[<Esc>p
vmap g" s""<Left><Esc>p
vmap g' s''<Left><Esc>p




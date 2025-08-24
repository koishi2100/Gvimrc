
setl cul	"高亮行
"setl nu		"显示行号
setl dictionary+=$VIMRUNTIME/acm/template/dictionary.txt	"字典补全

"F5 编译
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	redraw!
	if(&filetype == 'cpp')
		highlight CompileError guifg=red  
		highlight Finish guifg=green 
		highlight Compiling guifg=yellow
		echohl Compiling | echo "Compiling..." | echohl None
		let l:errors = system('g++ ' . expand('%') . ' -o ' . expand('%:r') . ' -O2 -w')
		"exec "silent !g++ % -o %< -O2 -w && exit 0 || (pause && exit 1)"
		if(shell_error == 1)
			exec "! g++ % -o %< -O2 -w"
			redraw!
			echohl CompileError | echo "Compile Error!" | echohl None
			return 1
		endif

		call Opentxt()
		redraw!
		echohl Finish | echo "Finished!" | echohl None
	elseif (expand('%') == 'in.txt')
		exec "w"
		exec "silent wincmd h"
		call CompileRunGcc()
	endif
	return 0
endfunc



"F6 运行文件
nmap <F6> :call RunGcc()<CR>
func! RunGcc()
	if(&filetype == 'cpp')
		echohl Compiling | echo "Running..." | echohl None
		exec "! %<" 
	endif
	redraw!
endfunc


"Ctrl+F6运行并读入in.txt
map <C-F6> :call InputandRun()<CR>
func! InputandRun()
	if(&filetype == 'cpp')
		echohl Compiling | echo "Running..." | echohl None
		exec "!%< <in.txt>out.txt&&type out.txt&&echo."
	endif

	call Opentxt()
	redraw!

	if(expand('%') == 'in.txt')
		exec "w"
		exec "silent wincmd h"
		:call InputandRun()
	endif
endfunc

nmap <C-CR> :call CompileRunIn()<CR>
func! CompileRunIn()
	if(expand('%') == 'in.txt')
		call InputandRun()
	elseif CompileRunGcc() == 0
		call InputandRun()
	endif
endfunc


nmap <F4> :silent call Opentxt()<CR>

"函数:打开in.txt和out.txt
func! Opentxt()
	if(FileIsOpen('in.txt') == 0||FileIsOpen('out.txt') == 0)
		silent exec "only"
		silent belowright vsplit in.txt
		silent exec "silent vertical resize 22"
		silent setl winfixwidth
		silent belowright sview out.txt
		silent exec "silent wincmd h"
	endif
	redraw!
endfunc

"函数;判断'文件'是否打开
function! FileIsOpen(file)
	let bufnr = bufnr(a:file)
	if bufnr != -1 && bufwinid(bufnr) != -1
		return 1
	else
		return 0
	endif
endfunction


"将复制内容覆写入in.txt
nmap <C-p> :silent call CtrlP()<CR>
function! CtrlP()
	if expand('%') == 'in.txt'
		%d
		exec "normal! \"+P"
		w
		wincmd h
	else
		exec "normal \"+p"
	endif
endfunction

nmap <C-x> <C-l><C-k><C-p>
vmap <C-x> <Esc><C-x>

"快速行注释
nmap <silent> <C-/> <S-v><C-/>
vmap <silent> <C-/> :call QuickComment()<CR>
function! QuickComment()  
	if(&filetype == 'cpp')
		if(getline('.')[0:1] == '//')
			execute "normal! 0\<C-v>\<right>d"
		else 
			exec "normal! \<C-v>^I//\<Esc>"
		endif
	endif
endfunction  


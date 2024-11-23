"---------------编译配置------------------
" 禁用数字键和 <F-n> 的组合 (什么2B写法????) 
map 1<F5> 1<F5>
map 2<F5> 1<F5>
map 3<F5> 1<F5>
map 4<F5> 1<F5>
map 5<F5> 1<F5>
map 6<F5> 1<F5>
map 7<F5> 1<F5>
map 8<F5> 1<F5>
map 9<F5> 1<F5>

map 1<F6> 1<F6>
map 2<F6> 1<F6>
map 3<F6> 1<F6>
map 4<F6> 1<F6>
map 5<F6> 1<F6>
map 6<F6> 1<F6>
map 7<F6> 1<F6>
map 8<F6> 1<F6>
map 9<F6> 1<F6>

map 1<C-F6> 1<C-F6>
map 2<C-F6> 1<C-F6>
map 3<C-F6> 1<C-F6>
map 4<C-F6> 1<C-F6>
map 5<C-F6> 1<C-F6>
map 6<C-F6> 1<C-F6>
map 7<C-F6> 1<C-F6>
map 8<C-F6> 1<C-F6>
map 9<C-F6> 1<C-F6>


"F5 编译
"编译参数 
"-o <文件名> 	指定生成文件名
"-O1 -O2 -O3   	优化级别
"-g 	在编译时添加调试信息  使用gdb调试时需要
"-Wall	显示所有编译警告信息
"-w		编译时不显示警告信息
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	redraw!
	if(&filetype == 'c' || &filetype == 'cpp' || &filetype == 'java' || &filetype == 'python')
		highlight CompileError guifg=red  
		highlight Finish guifg=green 
		highlight Compiling guifg=yellow
		echohl Compiling | echo "Compiling..." | echohl None
		if &filetype == 'c'
			exec "silent !gcc % -o %< && exit || pause" 
		elseif &filetype == 'cpp'
			let l:errors = system('g++ ' . expand('%') . ' -o ' . expand('%:r') . ' -O2 -w')
			"exec "silent !g++ % -o %< -O2 -w && exit 0 || (pause && exit 1)"
			if(shell_error == 1)
				exec "! g++ % -o %< -O2 -w"
				redraw!
				echohl CompileError | echo "Compile Error!" | echohl None
				return 1
			endif
		elseif &filetype == 'java'
			exec "silent !javac % && exit || pause"
		elseif &filetype == 'python'
			exec "!python %"
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
	if(&filetype == 'cpp' || &filetype == 'c' || &filetype == 'java' || &filetype == 'python')
		echohl Compiling | echo "Running..." | echohl None
		if &filetype == 'cpp'
			exec "! %<" 
		elseif &filetype == 'c'
			exec "! %<" 
		elseif &filetype == 'java'
			exec "!java %:r"
		elseif &filetype == 'python'
			exec "!python %"
		endif
		redraw!
	endif
endfunc


"Ctrl+F6运行并读入in.txt
map <C-F6> :call InputandRun()<CR>
func! InputandRun()
	if(&filetype == 'cpp' || &filetype == 'c' || &filetype == 'java' || &filetype == 'python')
		echohl Compiling | echo "Running..." | echohl None
		if &filetype == 'cpp'
			exec "!%< <in.txt>out.txt&&type out.txt&&echo."
		elseif &filetype == 'c'
			exec "! %< < in.txt > out.txt && type out.txt"
		elseif &filetype == 'java'
			exec "!java %:r < in.txt > out.txt && type out.txt"
		elseif &filetype == 'python'
			exec "!python % < in.txt > out.txt && type out.txt"
		endif

	call Opentxt()
	redraw!

	elseif (expand('%') == 'in.txt')
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


"函数:打开in.txt和out.txt
func! Opentxt()
	if(FileIsOpen('in.txt') == 0||FileIsOpen('out.txt') == 0)
	exec "only"
	belowright vsplit in.txt
	exec "silent vertical resize 21"
	belowright sview out.txt
	exec "silent wincmd h"
		endif
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




"F8 gdb调试
"map <F8> :call Rungdb()<CR>
"
"func! Rungdb()
"    exec "w"
"    exec "!g++ % -g -o %<"
"    exec "!gdb %<"
"endfunc

"将复制内容覆写入in.txt
nmap <C-p> :call CtrlP()<CR>
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



setl cul
setl nu

nnoremap <F5> :<C-u>call Run()<CR>
func! Run()
	exec "w"
	if(&filetype == 'python')
		exec "!python %"
		redraw!
	elseif(expand('%') == 'in.txt')
		exec 'w'
		exec 'silent wincmd h'
		call Run()
	endif
endfunc

nnoremap <F6> :<C-u>call Run2()<CR>
func! Run2()
	exec 'w'
	if(&filetype == 'python')
		if(FileIsOpen('in.txt') == 0 || FileIsOpen('out.txt') == 0)
			call Opentxt()
			redraw!
			return
		endif
		exec "!python %"
	endif
	call Opentxt()
	redraw!
endfunc

nnoremap <C-F6> :<C-u>call InRun()<CR>
func! InRun()
	exec 'w'
	if(&filetype == 'python')
		exec "!python % < in.txt > out.txt && type out.txt"
	endif
	call Opentxt()
	redraw!
	if(expand('%') == 'in.txt')
		exec 'silent wincmd h'
		call InRun()
	endif
endfunc

nnoremap <C-CR> :<C-u>call InRun()<CR>

"函数:打开in.txt和out.txt
func! Opentxt()
	if(FileIsOpen('in.txt') == 0||FileIsOpen('out.txt') == 0)
	exec "only"
	belowright vsplit in.txt
	exec "silent vertical resize 22"
	setl winfixwidth
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


"将复制内容覆写入in.txt
nnoremap <C-p> :<C-u>call CtrlP()<CR>
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


nmap <F5> :call Openhtml()<cr>
func! Openhtml()
	exec "w"
	exec "silent !%"
endfunc

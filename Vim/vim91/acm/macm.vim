augroup cpp_abbrev
    autocmd!

	"模版
	autocmd FileType cpp iab <buffer> acm <Esc>:0r $VIMRUNTIME/acm/template/t-acm.vim<CR>Gdd5G

	"函数
	autocmd FileType cpp iab <buffer> mqmi <Esc>:r $VIMRUNTIME/acm/template/m-qmi.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mqmx <Esc>:r $VIMRUNTIME/acm/template/m-qmx.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mread <Esc>:r $VIMRUNTIME/acm/template/m-read.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mgcd <Esc>:r $VIMRUNTIME/acm/template/m-gcd.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mexgcd <Esc>:r $VIMRUNTIME/acm/template/m-exgcd.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mexcrt <Esc>:r $VIMRUNTIME/acm/template/m-excrt.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mlcm <Esc>:r $VIMRUNTIME/acm/template/m-lcm.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> misp <Esc>:r $VIMRUNTIME/acm/template/m-isprime.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mfib <Esc>:r $VIMRUNTIME/acm/template/m-fib.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mget_phi <Esc>:r $VIMRUNTIME/acm/template/m-get_phi.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mget_primes <Esc>:r $VIMRUNTIME/acm/template/m-get_primes.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> msegt <Esc>:r $VIMRUNTIME/acm/template/m-segt.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mfact <Esc>:r $VIMRUNTIME/acm/template/m-fact.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mpc <Esc>:r $VIMRUNTIME/acm/template/m-pc.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mi128 <Esc>:r $VIMRUNTIME/acm/template/m-int128.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mbigint <Esc>:r $VIMRUNTIME/acm/template/m-bigint.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mlog <Esc>:r $VIMRUNTIME/acm/template/m-log.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mfrac <Esc>:r $VIMRUNTIME/acm/template/m-frac.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mhash <Esc>:r $VIMRUNTIME/acm/template/m-hash.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mlca <Esc>:r $VIMRUNTIME/acm/template/m-lca.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mfenwick <Esc>:r $VIMRUNTIME/acm/template/m-fenwick.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mdsu <Esc>:r $VIMRUNTIME/acm/template/m-dsu.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mgauss <Esc>:r $VIMRUNTIME/acm/template/m-gauss.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mgauss_xor <Esc>:r $VIMRUNTIME/acm/template/m-gauss_xor.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mdlx <Esc>:r $VIMRUNTIME/acm/template/m-dlx.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mmat_tree <Esc>:r $VIMRUNTIME/acm/template/m-mat_tree.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mmaxflow <Esc>:r $VIMRUNTIME/acm/template/m-maxflow.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mmincost <Esc>:r $VIMRUNTIME/acm/template/m-mincost.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mzhuliu <Esc>:r $VIMRUNTIME/acm/template/m-zhuliu.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mgeo <Esc>:r $VIMRUNTIME/acm/template/m-geo.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mget_fact <Esc>:r $VIMRUNTIME/acm/template/m-get_fact.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mpollard_rho <Esc>:r $VIMRUNTIME/acm/template/m-pollard_rho.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mkmp <Esc>:r $VIMRUNTIME/acm/template/m-kmp.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mexkmp <Esc>:r $VIMRUNTIME/acm/template/m-exkmp.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> msa <Esc>:r $VIMRUNTIME/acm/template/m-sa.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mmanacher <Esc>:r $VIMRUNTIME/acm/template/m-manacher.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mtrie <Esc>:r $VIMRUNTIME/acm/template/m-trie.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mxor_trie <Esc>:r $VIMRUNTIME/acm/template/m-xor_trie.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> macam <Esc>:r $VIMRUNTIME/acm/template/m-acam.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mmat <Esc>:r $VIMRUNTIME/acm/template/m-mat.vim<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mst <Esc>:r $VIMRUNTIME/acm/template/m-st.vim<CR><Esc>kdd


	"缩写  iunab 可以取消缩写
    autocmd FileType cpp iab <buffer> ll long long
    autocmd FileType cpp iab <buffer> ff double
    autocmd FileType cpp iab <buffer> ull unsigned long long
    autocmd FileType cpp iab <buffer> pii pair<int,int>
    autocmd FileType cpp iab <buffer> pll pair<long long,long long>
	autocmd FileType cpp iab <buffer> vi vector<int>
	autocmd FileType cpp iab <buffer> vll vector<long long>
	autocmd FileType cpp iab <buffer> i128 __int128
	"autocmd FileType cpp iab <buffer> endl '\n'
    autocmd FileType cpp iab <buffer> itn int
	autocmd FileType cpp iab <buffer> mian main
	autocmd FileType cpp iab <buffer> usign using
	autocmd FileType cpp iab <buffer> inlcude include
	autocmd FileType cpp iab <buffer> iostraem iostream
	autocmd FileType cpp iab <buffer> namesapce namespace
	autocmd FileType cpp iab <buffer> naemspace namespace
	autocmd FileType cpp iab <buffer> sdt std
	autocmd FileType cpp iab <buffer> cosnt const
	autocmd FileType cpp iab <buffer> Include include
	autocmd FileType cpp iab <buffer> Cin cin
	autocmd FileType cpp iab <buffer> Cout cout

augroup END

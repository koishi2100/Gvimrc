augroup cpp_abbrev
    autocmd!

	"模版
	autocmd FileType cpp iab <buffer> acm <Esc>:0r $VIMRUNTIME/acm/template/t-acm-cpp.cpp<CR>Gdd6G

	"函数
	autocmd FileType cpp iab <buffer> mqmi <Esc>:r $VIMRUNTIME/acm/template/m-qmi.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mqmx <Esc>:r $VIMRUNTIME/acm/template/m-qmx.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mread <Esc>:r $VIMRUNTIME/acm/template/m-read.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mgcd <Esc>:r $VIMRUNTIME/acm/template/m-gcd.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mexgcd <Esc>:r $VIMRUNTIME/acm/template/m-exgcd.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mexcrt <Esc>:r $VIMRUNTIME/acm/template/m-excrt.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mlcm <Esc>:r $VIMRUNTIME/acm/template/m-lcm.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> misp <Esc>:r $VIMRUNTIME/acm/template/m-isprime.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mfib <Esc>:r $VIMRUNTIME/acm/template/m-fib.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mget_phi <Esc>:r $VIMRUNTIME/acm/template/m-get_phi.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mget_primes <Esc>:r $VIMRUNTIME/acm/template/m-get_primes.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> msegt <Esc>:r $VIMRUNTIME/acm/template/m-segt.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mfact <Esc>:r $VIMRUNTIME/acm/template/m-fact.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mpc <Esc>:r $VIMRUNTIME/acm/template/m-pc.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mi128 <Esc>:r $VIMRUNTIME/acm/template/m-int128.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mbigint <Esc>:r $VIMRUNTIME/acm/template/m-bigint.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mlog <Esc>:r $VIMRUNTIME/acm/template/m-log.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mfrac <Esc>:r $VIMRUNTIME/acm/template/m-frac.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mhash <Esc>:r $VIMRUNTIME/acm/template/m-hash.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mlca <Esc>:r $VIMRUNTIME/acm/template/m-lca.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mfenwick <Esc>:r $VIMRUNTIME/acm/template/m-fenwick.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mdsu <Esc>:r $VIMRUNTIME/acm/template/m-dsu.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mgauss <Esc>:r $VIMRUNTIME/acm/template/m-gauss.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mgauss_xor <Esc>:r $VIMRUNTIME/acm/template/m-gauss_xor.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mdlx <Esc>:r $VIMRUNTIME/acm/template/m-dlx.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mmat_tree <Esc>:r $VIMRUNTIME/acm/template/m-mat_tree.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mmaxflow <Esc>:r $VIMRUNTIME/acm/template/m-maxflow.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mmincost <Esc>:r $VIMRUNTIME/acm/template/m-mincost.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mzhuliu <Esc>:r $VIMRUNTIME/acm/template/m-zhuliu.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mgeo <Esc>:r $VIMRUNTIME/acm/template/m-geo.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mget_fact <Esc>:r $VIMRUNTIME/acm/template/m-get_fact.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mpollard_rho <Esc>:r $VIMRUNTIME/acm/template/m-pollard_rho.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mkmp <Esc>:r $VIMRUNTIME/acm/template/m-kmp.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mexkmp <Esc>:r $VIMRUNTIME/acm/template/m-exkmp.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> msa <Esc>:r $VIMRUNTIME/acm/template/m-sa.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mmanacher <Esc>:r $VIMRUNTIME/acm/template/m-manacher.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mtrie <Esc>:r $VIMRUNTIME/acm/template/m-trie.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mxor_trie <Esc>:r $VIMRUNTIME/acm/template/m-xor_trie.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> macam <Esc>:r $VIMRUNTIME/acm/template/m-acam.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mmat <Esc>:r $VIMRUNTIME/acm/template/m-mat.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mst <Esc>:r $VIMRUNTIME/acm/template/m-st.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> msplay <Esc>:r $VIMRUNTIME/acm/template/m-splay.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mfft <Esc>:r $VIMRUNTIME/acm/template/m-fft.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mntt <Esc>:r $VIMRUNTIME/acm/template/m-ntt.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mrng <Esc>:r $VIMRUNTIME/acm/template/m-rng.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mlowbit <Esc>:r $VIMRUNTIME/acm/template/m-lowbit.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mlb <Esc>:r $VIMRUNTIME/acm/template/m-lb.cpp<CR><Esc>kdd
	autocmd FileType cpp iab <buffer> mget_inv <Esc>:r $VIMRUNTIME/acm/template/m-get_inv.cpp<CR><Esc>kdd



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



augroup python_abbrev

	autocmd FileType python iab <buffer> ii int(input())
	autocmd FileType python iab <buffer> mii map(int, input().split(' '))
	autocmd FileType python iab <buffer> lmii list(map(int, input().split(' ')))

augroup END

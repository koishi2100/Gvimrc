long long qmi(long long a,long long b,long long p){
	long long ans = 1;
	while(b){
		if(b&1) ans = __int128(ans) * a % p;
		b>>=1;
		a = __int128(a) * a % p;
	}
	return ans;
}

bool isprime(long long x) {
    if (x < 2 || x % 6 % 4 != 1) return (x|1) == 3;
    long long s = __builtin_ctzll(x-1), d = x >> s;
    for (long long a : {2, 325, 9375, 28178, 450775, 9780504, 1795265022}) {
        long long p = qmi(a % x, d, x), i = s;
        while (p != 1 && p != x - 1 && a % x && i--) {
			p = __int128(p) * p % x;
        }
        if (p != x - 1 && i != s) return 0;
    }
    return 1;
}

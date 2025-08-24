long long qmx(long long a, long long b, long long p) {
//	return __int128(a) * b % p;
	long long ans = 0;
	while (b) {
		if (b & 1) {
            ans = (ans + a) % p;
        }
		b >>= 1;
        a = (a + a) % p;		
	}
	return ans;
}

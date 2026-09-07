const int mod = 998244353,G = 3,GI = 332748118;

long long qmi(long long a,long long b,long long p){
	long long ans = 1;
	while(b){
		if(b&1) ans = ans*a%p;
		b>>=1;
		a = a*a%p;
	}
	return ans;
}

void NTT(std::vector<long long>& a, bool invert) {
	int n = a.size();

	for(int i = 1,j = 0;i < n;i++) {
		int bit = n >> 1;
		for (; j&bit; bit >>= 1) j ^= bit;
		j ^= bit;
		if (i < j) std::swap(a[i],a[j]);
	}

	for(int len = 2;len <= n;len <<= 1) {
		long long wlen = qmi(invert ? GI : G,(mod-1)/len,mod);
		for (int i = 0;i < n;i += len) {
			long long w = 1;
			for (int j = 0;j < len/2;j++) {
				long long u = a[i+j];
				long long v = a[i+j + len/2] * w % mod;
				a[i+j] = (u+v) % mod;
				a[i+j + len/2] = (u-v+mod) % mod;
				w = w * wlen % mod;
			}
		}
	}
	if(invert){
		long long inv_n = qmi(n,mod-2,mod);
		for(auto &x:a) x = x * inv_n % mod;
	}
}

std::vector<long long> operator * (std::vector<long long>a,std::vector<long long>b){//值传递
	int n = a.size(), m = b.size();

	int MAX_N = 1;
	while (MAX_N < n + m) MAX_N <<= 1;
	a.resize(MAX_N);
	b.resize(MAX_N);

	NTT(a, false);
	NTT(b, false);
	for(int i = 0; i < MAX_N; i++) a[i] = a[i] * b[i] % mod;
	NTT(a, true);

	while(a.size() >= 2 && a.back() == 0) a.pop_back();
	return a;
}

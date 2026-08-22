const long double PI = std::acos(-1.0);
void FFT(std::vector<std::complex<long double>>& a, bool invert) {
    int n = a.size();

    for(int i = 1,j = 0;i < n;i++) {
        int bit = n >> 1;
        for (; j&bit; bit >>= 1) j ^= bit;
        j ^= bit;
        if (i < j) std::swap(a[i],a[j]);
    }

    for(int len = 2;len <= n;len <<= 1) {
        long double ang = 2 * PI / len * (invert ? -1 : 1);
        std::complex<long double> wlen(cosl(ang), sinl(ang));
        for (int i = 0;i < n;i += len) {
            std::complex<long double> w(1.0);
            for (int j = 0;j < len/2;j++) {
                std::complex<long double> u = a[i+j];
                std::complex<long double> v = a[i+j + len/2] * w;
                a[i+j] = u+v;
                a[i+j + len/2] = u-v;
                w *= wlen;
            }
        }
    }
    if(invert){
        for(std::complex<long double> &x:a) x /= n;
    }
}

std::vector<long long> operator * (const std::vector<long long>&A,const std::vector<long long>&B){
    int n = A.size(), m = B.size();

    int MAX_N = 1;
    while (MAX_N < n + m) MAX_N <<= 1;

    std::vector<std::complex<long double>> a(MAX_N,0.0), b(MAX_N,0.0);
    for(int i = 0; i < n; i++) a[i] = std::complex<long double>(A[i],0);
    for(int i = 0; i < m; i++) b[i] = std::complex<long double>(B[i],0);

    FFT(a, false);
    FFT(b, false);
    for(int i = 0; i < MAX_N; i++) a[i] *= b[i];
    FFT(a, true);

	std::vector<long long>C(n+m);
    for(int i = 0; i < n + m; i++) {
		C[i] = (long long)(a[i].real() + 0.5);
    }

    while(C.size() >= 2 && C.back() == 0) C.pop_back();
	return C;
}

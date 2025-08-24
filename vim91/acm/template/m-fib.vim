pair<long long, long long> fib(long long n) { //fib(x).first
	if (n == 0) return {0, 1};
	auto [a,b] = fib(n >> 1);
	long long c = a * (2*b%mod - a + mod)%mod;
	long long d = (a*a%mod + b*b%mod)%mod;
	if (n&1) return {d,c+d};
	else return {c,d};
}

namespace PollardRho{
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

	long long gcd(long long a,long long b) {return b ? gcd(b,a%b) : a;}

	long long max_factor;
	long long Pollard_Rho(long long x) {
		long long s = 0, t = 0;
		long long c = (long long)rand() % (x - 1) + 1;
		long long val = 1;
		for (int goal = 1;; goal <<= 1, s = t, val = 1) {
			for (int step = 1; step <= goal; ++step) {
				t = ((__int128)t*t%x + c) % x;
				val = (__int128)val*std::abs(t-s)%x;
				if ((step % 127) == 0) {
					long long d = gcd(val, x);
					if (d > 1) return d;
				}
			}
			long long d = gcd(val, x);
			if (d > 1) return d;
		}
	}

	void fac(long long x) {
		if (x <= max_factor || x < 2) return;
		if (isprime(x)) {
			max_factor = std::max(max_factor, x);
			return;
		}
		long long p = x;
		while (p >= x) p = Pollard_Rho(x);
		while ((x % p) == 0) x /= p;
		fac(x), fac(p);
	}
	long long get_maxprime(long long x){
		max_factor = 0;
		fac(x);
		return max_factor;
	}
	std::vector<std::pair<long long,int>> factorize(long long x){
		std::vector<std::pair<long long,int>> ans;
		while(x > 1) {
			long long now = get_maxprime(x);
			ans.push_back({now,1});
			x /= now;
			while(x % now == 0) {
				ans.back().second++;
				x /= now;
			}
		}
		std::reverse(ans.begin(),ans.end());
		return ans;
	}
};
using PollardRho::isprime,PollardRho::get_maxprime,PollardRho::factorize;

std::vector<int> primes, minp, maxp;
void sieve(int n = 1e6) {
    minp.resize(n + 1);
    maxp.resize(n + 1);
    for (int i = 2; i <= n; i++) {
        if (!minp[i]) {
            minp[i] = maxp[i] = i;
            primes.emplace_back(i);
        }
        for (auto &j : primes) {
            if (j > minp[i] || j > n / i) break;
            minp[i * j] = j;
            maxp[i * j] = maxp[i];
        }
    }
}
std::vector<std::pair<int,int>> factorize(int n) {
	std::vector<std::pair<int,int>>ans;
    while (n > 1) {
        int now = minp[n], cnt = 0;
        while (n % now == 0) {
            n /= now;
            cnt++;
        }
        ans.push_back({now, cnt});
    }
    return ans;
}

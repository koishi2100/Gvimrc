std::vector<int> inv;
void get_inv(int n = 1000006) {
	inv.assign(n + 1, 0);
	inv[1] = 1;
	for (int i = 2; i <= n; i++) {
		inv[i] = (mod - 1LL * mod / i) * inv[mod % i] % mod;
	}
}

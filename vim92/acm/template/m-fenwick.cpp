template<typename T>
struct Fenwick { // 1_idx
	int n;
	std::vector<T> t;

	explicit Fenwick(int _n = 0) : n(_n) {
		t.assign(_n + 1, T{});
	}

	void add(int i, const T& x) {
		while (i <= n) {
			t[i] += x;
			i += i & -i;
		}
	}

	T sum(int i) {
		T ans = 0;
		while (i) {
			ans += t[i];
			i -= i & -i;
		}
		return ans;
	}


	int kth(T k) {
		int x = 0;
		T ans = 0;
		for (int i = std::log2(n); i >= 0; i--) {
			int nx = x + (1 << i);
			if (nx <= n && ans + t[nx] < k) {
				x = nx;
				ans += t[x];
			}
		}
		return x + 1;
	}

	T sum(int l, int r) { return sum(r) - sum(l - 1); }
	T query(int i) { return sum(i); }
	T query(int l, int r) { return sum(l, r); }
};

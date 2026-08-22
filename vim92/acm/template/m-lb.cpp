struct LB {
    const int BASE = 63;
    std::vector<long long> d, p;
    int cnt, flag;

    LB() {
        d.resize(BASE + 1);
        p.resize(BASE + 1);
        cnt = flag = 0;
    }

    bool insert(long long val) {
        for (int i = BASE - 1; i >= 0; i--) {
            if (val & (1ll << i)) {
                if (!d[i]) {
                    d[i] = val;
                    return true;
                }
                val ^= d[i];
            }
        }
        flag = 1;
        return false;
    }

    bool check(long long val) {
        for (int i = BASE - 1; i >= 0; i--) {
            if (val & (1ll << i)) {
                if (!d[i]) {
                    return false;
                }
                val ^= d[i];
            }
        }
        return true;
    }

    long long ask_max() {
        long long res = 0;
        for (int i = BASE - 1; i >= 0; i--) {
            if ((res ^ d[i]) > res) res ^= d[i];
        }
        return res;
    }

    long long ask_min() {
        if (flag) return 0; // special check zero
        for (int i = 0; i <= BASE - 1; i++) {
            if (d[i]) return d[i];
        }
		return 0;
    }

    void rebuild() { // prework before query kth_min/kth_max
		cnt = 0;
        for (int i = BASE - 1; i >= 0; i--) {
            for (int j = i - 1; j >= 0; j--) {
                if (d[i] & (1ll << j)) d[i] ^= d[j];
            }
        }
        for (int i = 0; i <= BASE - 1; i++) {
            if (d[i]) p[cnt++] = d[i];
        }
    }

    long long kth_min(long long k) { // kth_min (1_idx)
        if (flag) k--; // special check zero
        if (k == 0) return 0;
        long long res = 0;
        if (k < 0 || k >= (1ll << cnt)) return -1;
        for (int i = BASE - 1; i >= 0; i--) {
            if (k & (1LL << i)) res ^= p[i];
        }
        return res;
    }
	
	long long kth_max(long long k) { // kth_max (1_idx)
		long long total = (1ll << cnt) - 1;
		if (flag) total++;
		if (k > total) return -1;
		
		return kth_min(total - k + 1);
	}

    void Merge(const LB &b) {
        for (int i = BASE - 1; i >= 0; i--) {
            if (b.d[i]) {
                insert(b.d[i]);
            }
        }
    }
};

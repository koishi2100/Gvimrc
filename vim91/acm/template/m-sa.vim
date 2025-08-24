namespace SA{
	int n;
	std::vector<int>sa,c,x,y,rk,height;

	template<typename T>
	void build (const T &s) {//1_idx get:sa[]
		sa = x = y = std::vector<int>(n+1);
		int m = 300;
		c.resize(std::max(n,m)+1);
		for (int i = 1; i <= m; i++) c[i] = 0;
		for (int i = 1; i <= n; i++) c[x[i] = s[i]]++;
		for (int i = 1; i <= m; i++) c[i] += c[i - 1];
		for (int i = n; i >= 1; i--) sa[c[x[i]]--] = i;
		for (int j = 1; j <= n; j <<= 1) {
			int p = 0;
			for (int i = n - j + 1; i <= n; i ++) y[++p] = i; 
			for (int i = 1; i <= n; i++) if (sa[i] > j) y[++p] = sa[i] - j;
			for (int i = 1; i <= m; i++) c[i] = 0;
			for (int i = 1; i <= n; i++) c[x[y[i]]]++;
			for (int i = 1; i <= m; i++) c[i] += c[i - 1];
			for (int i = n; i >= 1; i--) sa[c[x[y[i]]]--] = y[i];
			std::swap (x, y);
			p = 1;
			x[sa[1]] = 1;
			for (int i = 2; i <= n; i ++) {
				x[sa[i]] = y[sa[i-1]] == y[sa[i]] && y[sa[i-1]+j] == y[sa[i]+j] ? p : ++p;
			}
			if (p >= n) break;
			m = p;
		}
	}

	template<typename T>
	void make (const T &s) {//get:rk[],height[]
		rk = height = std::vector<int>(n+1);
		int k = 0;
		for (int i = 1; i <= n; i ++) rk[sa[i]] = i;
		for (int i = 1; i <= n; i ++) {
			if (rk[i] == 1) continue;
			if (k) k --;
			int j = sa[rk[i] - 1];
			while (j + k <= n and i + k <= n and s[i + k] == s[j + k]) {
				++ k;
			}
			height[rk[i]] = k;
		}
	}

	template<typename T>
	std::vector<int> get_sa(const T &s){
		n = s.size()-1;
		build(s);
		make(s);
		return sa;
	}
}
using SA::get_sa,SA::sa,SA::rk,SA::height;

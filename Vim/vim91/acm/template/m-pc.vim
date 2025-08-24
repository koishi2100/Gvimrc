struct PC{ //PC t(n,m);
	int n,m;
	vector<int>path; //1_idx
	PC(int n,int m){
		this->n = n;this->m = m;
		path.resize(n+1);
		for(int i = 1;i <= n;i++) path[i] = i;
	}
    bool next_comb(){
        int j = m;
        while (j >= 1 && path[j] == n - m + j) j--;
        if (j == 0) return 0;
        path[j]++;
        for (int i = j + 1; i <= m; i++) path[i] = path[i - 1] + 1;
        return 1;
    }
	bool next_perm(){
        for (int i = m,used = 0; i >= 1; i--,used = 0) {
            for (int j = 1; j < i; ++j)  used |= 1 << path[j];
			for (int x = path[i]+1;x <= n;x++){
				if((used >> x & 1)) continue;
				path[i] = x; used = ~(used | 1 << x) ^ 1;
				for(int j = i+1;j <= m;j++){
					int w = __builtin_ctz(used);
					path[j] = w;
					used ^= 1 << w;
				}
				return 1;
			}
        }
        return 0;
    }
};

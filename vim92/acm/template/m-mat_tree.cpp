struct Mat{//1_idx
	std::vector<std::vector<long long>>a;

	Mat(int n){
		a = std::vector<std::vector<long long>>(n+1,std::vector<long long>(n+1));
	}

	void add(int x,int y,int w){//add_edge(x,y,1);
		if(x == y) return;
		a[y][y] = (a[y][y] + w) % mod;
		a[x][y] = (a[x][y] - w) % mod;
	}

	long long det(int n){
		long long ans = 1;
		for(int i = 2;i <= n;i++){//equal:remove(row_1,col_1)
			for(int j = i+1;j <= n;j++){
				while(a[j][i]){
					long long t = a[i][i]/a[j][i];
					for(int k = i;k <= n;k++) {
						a[i][k] = (a[i][k] - a[j][k] * t % mod + mod) % mod;
					}
					std::swap(a[i],a[j]);
					ans = -ans;
				}
			}
			if(!a[i][i]) return 0;
			ans = (ans * a[i][i] % mod + mod) % mod;
		}
		return std::abs(ans);
	}
};

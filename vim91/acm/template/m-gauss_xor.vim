int gauss_xor(vector<vector<int>>&a){//m * n+1; 1_idx
	int m = a.size()-1,n = a[0].size()-2;
	int c,r;
	for(c = 1,r = 1;c <= n;c++){
		int tr = r;
		for(int i = r;i <= m;i++){
			if(a[i][c]) {tr = i;break;}
		}
		if(a[tr][c] == 0) continue;

		swap(a[r],a[tr]);

		for(int i = r+1;i <= m;i++){
			if(a[i][c]){
				for(int j = n+1;j >= c;j--){
					a[i][j] ^= a[r][j];
				}
			}
		}
		r++;
	}

	if(r < n+1){
		for(int i = r;i <= m;i++){
			if(a[i][n+1]) return 0;//No_solution
		}
		return 2;//Muitiple_solutions
	}

	for(int i = n;i >= 1;i--){
		for(int j = i+1;j <= n;j++){
			if(a[i][j]) a[i][n+1] ^= a[j][n+1];
		}
	}
	return 1; //ans::a[1~m][n+1]
}

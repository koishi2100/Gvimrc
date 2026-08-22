const double eps = 1e-9;
int gauss(vector<vector<double>>&a) {//m * n+1;  1_idx
    int m = a.size()-1,n = a[0].size()-2;
	int c,r;

    for (c = 1,r = 1; c <= n && r <= m; c++) {
        int tr = r;
        for (int i = r+1; i <= m; i++) {
            if (fabs(a[i][c]) > fabs(a[tr][c])) { tr = i; }
        }
        if (fabs(a[tr][c]) < eps)  continue;

		swap(a[r],a[tr]);
		for(int j = n+1;j >= c;j--) {a[r][j] /= a[r][c];}

        for (int i = r+1; i <= m; i++) {
			if(fabs(a[i][c]) > eps){
				for(int j = n+1;j >= c;j--){
					a[i][j] -= a[i][c]*a[r][j];
				}
			}
        }
        r++;
    }

    if (r < n+1) {
		for (int i = r; i <= m; i++) {
			if (fabs(a[i][n+1]) > eps) {
				return 0; //no_solution
			}
		}
		return 2; //multiple_solutions
    }

	for(int i = n;i >= 1;i--){
		for(int j = i+1;j <= n;j++){
			a[i][n+1] -= a[j][n+1]*a[i][j];
		}
	}
	return 1; //ans::a[1~m][n+1]
}

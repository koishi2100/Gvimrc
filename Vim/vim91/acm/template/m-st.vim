namespace S_T{ //1_idx
	const int N = 1000006;
	int lg2[N];

	struct info{
		long long mx; //mn,gcd,and,or;

		info(){}
		info(const int &x) { //init_info
			mx = x;
		}

		info friend operator + (const info &e1,const info &e2) { //updaet_info
			info ans;
			ans.mx = std::max(e1.mx,e2.mx);
			return ans;
		}
	};


	void init_lg2(){
		lg2[0] = -1;
		for(int i = 1;i < N;i++){
			lg2[i] = lg2[i>>1]+1;
		}
	}

	template<typename T>
	struct ST{
		int n,m;
		std::vector<std::vector<info>>st;

		ST(){}
		ST(const T &v) {
			if(~lg2[0]) init_lg2();
			n = v.size()-1,m = lg2[v.size()];
			st = std::vector<std::vector<info>>(n+1,std::vector<info>(m+1));

			for(int i = 1;i < v.size();i++){ st[i][0] = v[i]; }
			for(int j = 1;(1<<j) < v.size();j++){
				int pj = 1 << (j-1);
				for(int i = 1;i+(1<<j)-1 < v.size();i++){
					st[i][j] = st[i][j-1] + st[i+pj][j-1];
				}
			}
		}

		info query(int l,int r) {
			int x = lg2[r-l+1];
			info ans = st[l][x] + st[r-(1<<x)+1][x];
			return ans;
		}
	};
}
using S_T::ST,S_T::info;

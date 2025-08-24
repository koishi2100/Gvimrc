template<typename T>
struct EXKMP{ //1_idx
	T a;
	std::vector<int>z;

	EXKMP(){}
	EXKMP(const T&v){ init(v); }

	void init(const T &v) {
		a = v;
		z = std::vector<int>(a.size());
		for(int i = 2,k = 1;i < a.size();i++){
			if(k+z[k]-i <= z[i-k+1]) {
				z[i] = k+z[k]-i;
				if(z[i] < 0) z[i] = 0;
				while(i+z[i] < a.size() && a[z[i]+1] == a[z[i]+i]) ++z[i];
				k = i;
			}
			else{
				z[i] = z[i-k+1];
			}
		}
		z[1] = 0;//or a.size()-1?
	}

	std::vector<int> exkmp(const T&v){
		std::vector<int>ans(v.size());
		for(int i = 1,k = 1;i < v.size();i++){
			if(k+ans[k]-i <= z[i-k+1]) {
				ans[i] = k+ans[k]-i;
				if(ans[i] < 0) ans[i] = 0;
				while(i+ans[i] < v.size() && ans[i] < a.size() && a[ans[i]+1] == v[ans[i]+i]) ++ans[i];
				k = i;
			}
			else{
				ans[i] = z[i-k+1];
			}
		}
		return ans;
	}
};

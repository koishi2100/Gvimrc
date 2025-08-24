template<typename T>
struct KMP{ //1_idx
	T a;
	std::vector<int> ne;

	KMP(){}
	KMP(const T&v){ init(v); }

	void init(const T&v){
		a = v;
		ne.assign(a.size(),{});
		for(int i = 2,j = 0;i < a.size();i++){
			while(j > 0 && a[i] != a[j+1]) j = ne[j];
			if(a[i] == a[j+1]) j++;
			ne[i] = j;
		}
	}

	std::vector<int> kmp(const T&b){
		std::vector<int>ans;
		for(int i = 1,j = 0;i < b.size();i++){
			while(j > 0 && b[i] != a[j+1]) j = ne[j];
			if(b[i] == a[j+1]) j++;
			//f[i] = j;
			if(j == a.size()-1) ans.push_back(i-a.size()+2);
		}
		return ans;
	}
};

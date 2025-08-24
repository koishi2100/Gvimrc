template<typename T>
struct Manacher{ //1_idx
	int n,ans;
	T s;
	std::vector<int>d;

	Manacher(){}
	Manacher(const T &v){
		init(v);
	}

	void init(const T &v){
		s = " #";
		for(int i = 1;i < v.size();i++){
			s += v[i];
			s += '#';
		}
		n = s.size()-1;
		d = std::vector<int>(n+1,0);

		ans = 0;
		for(int i = 1,l = 0,r = 0;i <= n;i++){
			if(i > r) d[i] = 1;
			else d[i] = std::min(d[l*2-i],r-i+1);
			while(i-d[i] >= 1 && i+d[i] <= n && s[i-d[i]] == s[i+d[i]]) d[i]++;
			if(i+d[i]-1 > r) l = i,r = i+d[i]-1;
			ans = std::max(ans,d[i]-1);
		}
	}

	bool query(int l,int r){
		l <<= 1,r <<= 1;
		int mid = l + r >> 1;
		return d[mid]-1 >= r-mid;
	}
};

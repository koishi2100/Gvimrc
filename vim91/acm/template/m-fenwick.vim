template<typename T>
struct Fenwick{
	int n;
	vector<T>t;

	Fenwick(int n_ = 0){
		init(n_);
	}

	void init(int n_){
		n = n_ + 1;
		t.assign(n,T{});
	}

	void add(int i,const T &x){
		while(i <= n){
			t[i] += x;
			i += i&-i;
		}
	}

	T sum(int i){
		T ans = 0;
		while(i){
			ans += t[i];
			i -= i&-i;
		}
		return ans;
	}

	T sum(int l,int r){
		return sum(r) - sum(l-1);
	}

	int kth(int k){
		int sum = 0,x = 0;
		for(int i = log2(n);i >= 0;i--){
			int nx = x + (1 << i);
			if(nx < n && sum + t[nx] < k){
				x = nx;
				sum += t[x];
			}
		}
		return x + 1;
	}
};

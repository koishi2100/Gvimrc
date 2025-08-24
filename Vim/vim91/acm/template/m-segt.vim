struct Segtree{
	int n;
	struct ST{
		int l,r;

	};

	std::vector<ST>t;

	Segtree(int n_){
		n = n_+1;
		t.assign(n<<2,{});
		build(1,1,n);
	}

	void build(int p,int l,int r){
		t[p] = {l,r};
		if(l == r){build(t[p],l);return;}
		int mid = l + r >> 1;
		build(p<<1,l,mid);build(p<<1|1,mid+1,r);
		pushup(t[p],t[p<<1],t[p<<1|1]);
	}

	void modify(int p,int l,int r,long long x){
		if(l <= t[p].l && r >= t[p].r) {update(t[p],x);return;}
		pushdown(t[p],t[p<<1],t[p<<1|1]);
		int mid = t[p].l + t[p].r >> 1;
		if(l <= mid) modify(p<<1,l,r,x);
		if(r > mid) modify(p<<1|1,l,r,x);
		pushup(t[p],t[p<<1],t[p<<1|1]);
	}

	ST query(int p,int l,int r){
		if(l <= t[p].l && r >= t[p].r){return t[p];}
		pushdown(t[p],t[p<<1],t[p<<1|1]);
		int mid = t[p].l + t[p].r >> 1;
		if(r <= mid) return query(p<<1,l,r);
		if(l > mid) return query(p<<1|1,l,r);
		ST pl = query(p<<1,l,r),pr = query(p<<1|1,l,r),ans;
		pushup(ans,pl,pr);
		return ans;
	}

	void modify(int l,int r,long long x){modify(1,l,r,x);}

	ST query(int l,int r){return query(1,l,r);}

	void pushdown(ST &p,ST &pl,ST &pr){

	}

	void update(ST &p,long long x){

	}

	void pushup(ST &p,ST &pl,ST &pr){

	}

	void build(ST &p,int i){

	}
};

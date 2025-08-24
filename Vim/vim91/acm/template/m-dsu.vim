struct DSU{
	vector<int>p,siz;

	explicit DSU(size_t n) : p(n+1),siz(n+1,1){
		iota(p.begin(),p.end(),0);
	}

	int find(int x){
		if(p[x] != x) p[x] = find(p[x]);
		return p[x];
	}

	bool same(int x,int y){
		return find(p[x]) == find(p[y]);
	}

	int size(int x){
		return siz[find(x)];
	}

	int merge(int x,int y){
		x = find(x),y = find(y);
		if(x == y) return y;
		if(siz[x] > siz[y]) swap(x,y);
		siz[y] += siz[x];
		p[x] = y;
		return y;
	}
};

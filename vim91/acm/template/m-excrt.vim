struct node{
	long long a,b; //x%a == b
};

long long exgcd(long long a,long long b,long long& x,long long& y){
	if(!b){
		x = 1,y = 0;
		return a;
	}
	long long d = exgcd(b,a%b,x,y);
	long long x1 = x,y1 = y;
	x = y1,y = x1 - a/b*y1;
	return d;
}

long long excrt(const std::vector<node> &e){ //0_idx
	long long ans = e[0].b,M = e[0].a,x = 0,y = 0;
	for(int i = 1;i < e.size();i++){
		long long B = ((e[i].b - ans) % e[i].a + e[i].a) % e[i].a;
		long long d = exgcd(M,e[i].a,x,y);
		if(B%d) {return -1;}
		x = (__int128)x*(B/d) % e[i].a;
		ans += M*x;
		M *= e[i].a / d;
		ans = (ans + M) % M;
	}
	return ans;
}

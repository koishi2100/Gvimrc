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

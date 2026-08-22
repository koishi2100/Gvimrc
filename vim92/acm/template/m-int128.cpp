std::ostream &operator<<(std::ostream &os, __int128 n) {
    if (n == 0) {
        return os << 0;
    }
    std::string s;
	bool _f = 0;
	if(n < 0) n = ~n+1,_f = 1;
    while (n > 0) {
        s += char('0' + n % 10);
        n /= 10;
    }
	if(_f) s += '-';
    std::reverse(s.begin(), s.end());
    return os << s;
}

std::istream &operator >> (std::istream &is,__int128 &n){
	string s;is >> s;
	n = 0;
	__int128 f = 1;
	for(int i = 0;i < s.size();i++){
		if(s[i] == '-') f = -1;
		else n = n*10 + s[i] - '0';
	}
	n *= f;
	return is;
}

inline __int128 read(){
    __int128 x = 0,f = 1;
    char ch = getchar();
    while(ch<'0'||ch>'9'){
        if(ch == '-') f=-1;
        ch = getchar();
    }
    while(ch>='0' && ch<='9'){
        x = x*10 + ch - '0';
        ch = getchar();
    }
    return x*f;
}

inline void write(__int128 x){
    if(x < 0){ putchar('-'),x *= -1;}
    if(x > 9) write(x/10);
    putchar(x % 10 + '0');
}
 
__int128 stoi128(const std::string &s){
	__int128 x = 0,f = 1;
	for(int i = 0;i < s.size();i++){
		if(s[i] == '-') { f = -1;}
		else{x *= 10;x += s[i] - '0';}
	}
	return x*f;
}
 
__int128 sqrti128(__int128 n) {
    __int128 lo = 0, hi = 1E16;
    while (lo < hi) {
        __int128 x = (lo + hi + 1) / 2;
        if (x * x <= n) { lo = x;} 
		else { hi = x - 1; }
    }
    return lo;
}

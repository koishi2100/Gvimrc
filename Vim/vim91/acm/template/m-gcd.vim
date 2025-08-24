template<typename T>
T gcd(T a,T b){
//	return b ? gcd(b,a%b) : a;
	int az = __builtin_ctzll(a),bz = __builtin_ctzll(b);
	int z = std::min(az,bz);
	b >>= bz;
	while(a) {
		a >>= az;
		T dif = b-a;
		az = __builtin_ctz(dif);
		if(a < b) b = a;
		if(dif < 0) a = -dif;
		else a = dif;
	}
	return b << z;
}

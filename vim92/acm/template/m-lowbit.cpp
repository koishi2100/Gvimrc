template<typename T>
T lowbit(T x){ return x&-x; }
long long upbit(long long x){ return x ? 1LL << (63 - __builtin_clzll(x)) : 0; }

long long fact[N],infact[N];
void init(){
	fact[0] = infact[0] = 1;
	for(int i = 1;i < N;i++){
		fact[i] = fact[i-1]*i%mod;
	}
	infact[N-1] = qmi(fact[N-1],mod-2,mod);
	for(int i = N-2;i >= 1;i--){
		infact[i] = infact[i+1]*(i+1)%mod;
	}
}

long long C(int a,int b){
	if(a < b) return 0;
	return fact[a]*infact[b]%mod*infact[a-b]%mod;
}

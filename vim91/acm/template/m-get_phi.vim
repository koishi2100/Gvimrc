int phi[N],primes[N],cnt;
bool vis[N];
void get_phi(int n){
    phi[1] = 1;
	for(int i = 2;i <= n;i++){
		if(!vis[i]) {
			primes[++cnt] = i;
			phi[i] = i-1;
		}
		for(int j = 1;primes[j] <= n/i;j++){
			vis[i*primes[j]] = 1;
			if(i%primes[j] == 0) {
				phi[i*primes[j]] = phi[i]*primes[j];
				break;
			}
			else phi[i*primes[j]] = phi[i]*(primes[j]-1);
		}
	}
}

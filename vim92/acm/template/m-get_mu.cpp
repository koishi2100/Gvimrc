int mu[N],primes[N],cnt;
bool vis[N];
void get_mu(int n){
	mu[1] = 1;
	for(int i = 2;i <= n;i++){
		if(!vis[i]) {
			primes[++cnt] = i;
			mu[i] = -1;
		}
		for(int j = 1;i*primes[j] <= n;j++){
			vis[i*primes[j]] = 1;
			if(i%primes[j] == 0) {
				mu[i*primes[j]] = 0;
				break;
			}
			else mu[i*primes[j]] = -mu[i];
		}
	}
}

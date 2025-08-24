int primes[N],cnt;
bool vis[N];
void get_primes(int n){
    for(int i=2;i<=n;i++){
        if(!vis[i]) primes[++cnt]=i;
        for(int j=1;primes[j]<=n/i;j++){
            vis[primes[j]*i]=true;
            if(i%primes[j]==0) break;
        }
    }
}

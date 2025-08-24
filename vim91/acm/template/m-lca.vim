int fa[N][22],deep[N];
void dfs(int u,int father){//dfs(root,0);
	fa[u][0] = father;
	deep[u] = deep[father] + 1;
	for(int i = 1;(1 << i) <= deep[u];i++){
		fa[u][i] = fa[fa[u][i-1]][i-1];
	}
	for(auto &k:e[u]){
		if(k != father) dfs(k,u);
	}
}
int lca(int x,int y){
	if(deep[x] < deep[y]) swap(x,y);
	for(int i = 20;i >= 0;i--){
		if(deep[fa[x][i]] >= deep[y]) x = fa[x][i];
	}
	if(x == y) return x;
	for(int i = 20;i >= 0;i--){
		if(fa[x][i] != fa[y][i]){
			x = fa[x][i];
			y = fa[y][i];
		}
	}
	return fa[x][0];
}

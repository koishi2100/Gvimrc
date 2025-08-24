const int INF = 0x3f3f3f3f;
template<typename T>
struct Zhuliu{ //1_idx
	struct Edge{int a,b;T c;};
	int n,root;
	std::vector<Edge>edge;

	Zhuliu(int _n,int _root){
		n = _n,root = _root;
		edge.clear();
	}

	void add(int a,int b,T c){
		edge.push_back({a,b,c});
	}

	T sol(){
		T ans = 0;
		while(1){
			int tot = 0;
			std::vector<int>loop(n+1),vis(n+1),fa(n+1);
			std::vector<T>mn(n+1,INF);

			for(auto &[a,b,c]:edge){
				if(a != b && mn[b] > c){
					mn[b] = c;
					fa[b] = a;
				}
			}
			mn[root] = 0;

			for(int i = 1;i <= n;i++){
				if(mn[i] == INF) return -1;
				ans += mn[i];
			}

			for(int a = 1;a <= n;a++){
				int b = a;
				while(b != root && !vis[b] && !loop[b]) {
					vis[b] = a;
					b = fa[b];
				}
				if(b != root && vis[b] == a){
					loop[b] = ++tot;
					for(int k = fa[b];k != b;k = fa[k]){
						loop[k] = tot;
					}
				}
			}
			if(!tot) return ans;

			for(int i = 1;i <= n;i++){
				if(!loop[i]) loop[i] = ++tot;
			}
			for(int i = 0;i < edge.size();i++){
				auto &[a,b,c] = edge[i];
				edge[i] = {loop[a],loop[b],c-mn[b]};
			}
			n = tot;
			root = loop[root];
		}
	}
};

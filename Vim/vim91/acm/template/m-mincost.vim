const int INF = 0x3f3f3f3f;
template<typename T>
struct Dinic{
	int n,s1,s2,idx;
	T maxflow,mincost;

	std::vector<int>h,e,ne,now,vis;
	std::vector<T>w,c,d;

	Dinic(int _n,int _s1,int _s2){
		n = _n+2; s1 = _s1; s2 = _s2; idx = 0;
		h = now = std::vector<int>(n,-1);
		e.clear(); ne.clear(); w.clear(); c.clear();
	}

	void add(int a,int b,T x,T y){
		c.emplace_back(y),w.emplace_back(x),e.emplace_back(b),ne.emplace_back(h[a]),h[a] = idx++;
		c.emplace_back(-y),w.emplace_back(0),e.emplace_back(a),ne.emplace_back(h[b]),h[b] = idx++;
	}

	bool bfs(){
		d = std::vector<T>(n,INF);
		vis = std::vector<int>(n);
		std::queue<int>q;
		q.push(s1);
		d[s1] = 0;
		now[s1] = h[s1];
		while(q.size()){
			int x = q.front();
			q.pop();
			vis[x] = 0;
			for(int i = h[x];~i;i = ne[i]){
				int y = e[i];
				if(w[i] && d[y] > d[x] + c[i]){
					d[y] = d[x] + c[i];
					now[y] = h[y];
					if(!vis[y]){
						vis[y] = 1;
						q.push(y);
					}
				}
			}
		}
		return d[s2] < INF;
	}

	T dfs(int x,T flow){
		if(x == s2) return flow;
		vis[x] = 1;
		T res = 0;
		for(int i = now[x];~i && flow;i = ne[i]){
			now[x] = i;
			int y = e[i];
			if(w[i] && d[y] == d[x] + c[i] && !vis[y]){
				T k = dfs(y,std::min(flow,w[i]));
				if(k == 0) d[y] = 0;
				w[i] -= k;
				w[i^1] += k;
				res += k;
				flow -= k;
				mincost += k * c[i];
			}
		}
		vis[x] = 0;
		return res;
	}

	std::pair<T,T> sol(){
		maxflow = mincost = 0;
		while(bfs()) maxflow += dfs(s1,INF);
		return {maxflow,mincost};
	}
};

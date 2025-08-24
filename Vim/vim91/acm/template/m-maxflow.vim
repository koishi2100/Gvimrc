const int INF = 0x3f3f3f3f;
template<typename T>
struct Dinic{
	int n,s1,s2,idx;
	T maxflow;

	std::vector<int>h,e,ne,d,now;
	std::vector<T>w;

	Dinic(int _n,int _s1,int _s2){
		n = _n+2; s1 = _s1; s2 = _s2; idx = 0;
		h = now = std::vector<int>(n,-1);
		e.clear(); ne.clear(); w.clear();
	}

	void add(int a,int b,T c){
		w.emplace_back(c),e.emplace_back(b),ne.emplace_back(h[a]),h[a] = idx++;
		w.emplace_back(0),e.emplace_back(a),ne.emplace_back(h[b]),h[b] = idx++;
	}

	bool bfs(){
		d = std::vector<int>(n);
		std::queue<int>q;
		q.push(s1);
		d[s1] = 1;
		now[s1] = h[s1];
		while(q.size()){
			int x = q.front();
			q.pop();
			for(int i = h[x];~i;i = ne[i]){
				int y = e[i];
				if(w[i] && !d[y]){
					d[y] = d[x] + 1;
					now[y] = h[y];
					q.push(y);
					if(y == s2) return 1;
				}
			}
		}
		return 0;
	}

	T dfs(int x,T flow){
		if(x == s2) return flow;
		T res = 0;
		for(int i = now[x];~i && flow;i = ne[i]){
			now[x] = i;
			int y = e[i];
			if(w[i] && d[y] == d[x] + 1){
				T k = dfs(y,std::min(flow,w[i]));
				if(k == 0) d[y] = 0;
				w[i] -= k;
				w[i^1] += k;
				res += k;
				flow -= k;
			}
		}
		return res;
	}

	T sol(){
		maxflow = 0;
		while(bfs()) maxflow += dfs(s1,INF);
		return maxflow;
	}
};

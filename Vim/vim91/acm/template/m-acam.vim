namespace ACAM{//0_idx
	const int N = 1000006, M = 26;//N:sum_char
	int son[N][M],cnt[N],fail[N],idx;

	struct Trie{

		Trie(){idx = 0;init(idx);}

		void init(int p){
			fail[p] = cnt[p] = 0;
			std::memset(son[p], 0, sizeof(son[p]));
		}

		int get(char x){//
			if(x >= 'a' && x <= 'z') return x - 'a';
			if(x >= 'A' && x <= 'Z') return x - 'A' + 26;
			if(x >= '0' && x <= '9') return x - '0' + 52;
			return -1;
		}

		void insert(const std::string &s){
			int p = 0;
			for(int i = 0;i < s.size();i++){
				int u = get(s[i]);
				if(!son[p][u]) {
					son[p][u] = ++idx;
					init(idx);
				}
				p = son[p][u];
			}
			cnt[p]++;
		}

		void get_fail(){ //remember exec me!!!
			fail[0] = 0;
			std::queue<int>q;
			for(int u = 0;u < M;u++){
				if(son[0][u]) {
					fail[son[0][u]] = 0;
					q.push(son[0][u]);
				}
			}
			while(q.size()){
				int p = q.front();
				q.pop();
				for(int u = 0;u < M;u++){
					if(son[p][u]) {
						fail[son[p][u]] = son[fail[p]][u];
						q.push(son[p][u]);
					}
					else {
						son[p][u] = son[fail[p]][u];
					}
				}
			}
		}

		int query(const std::string &s){
			int p = 0,ans = 0;
			for(int i = 0;i < s.size();i++){
				int u = get(s[i]);
				p = son[p][u];
				for(int t = p;t && cnt[t] != -1;t = fail[t]){
					ans += cnt[t];
					cnt[t] = -1;
				}
			}
			return ans;
		}
	};
};
using ACAM::Trie; //Trie t;
using ACAM::fail,ACAM::son,ACAM::cnt,ACAM::idx;

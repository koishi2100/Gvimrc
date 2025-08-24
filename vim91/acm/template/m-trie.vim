namespace TRIE{//0_idx
	const int N = 1000006,M = 26;//sum_char
	int son[N][M],cnt[N],idx;

	struct Trie{

		Trie(){idx = 0;init(idx);}

		void init(int p){
			cnt[p] = 0;
			memset(son[p], 0, sizeof(son[p]));
		}

		int get(char x){ //
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
					init(p);
				}
				p = son[p][u];
			}
			cnt[p]++;
		}

		int query(const std::string &s){
			int p = 0;
			for(int i = 0;i < s.size();i++){
				int u = get(s[i]);
				if(!son[p][u]) return 0;
				p = son[p][u];
			}
			return cnt[p];
		}
	};
};
using TRIE::Trie; //Trie t;

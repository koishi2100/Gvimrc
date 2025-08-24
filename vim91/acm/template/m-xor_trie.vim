namespace TRIE{//0_idx  x<(2^31)
	const int SIZ = 100005*32;
	int son[SIZ][2],cnt[SIZ],idx;

	struct xor_Trie{

		Trie(){idx = 0;init(idx);}

		void init(int p){
			cnt[p] = 0;
			memset(son[p], 0, sizeof(son[p]));
		}

		void insert(const int &x){
			int p = 0;
			for(int i = 30;i >= 0;i--){
				bool u = x >> i & 1;
				if(!son[p][u]) {
					son[p][u] = ++idx;
					init(p);
				}
				p = son[p][u];
			}
			cnt[p]++;
		}

		int query(const int &x){
			int ans = 0;
			int p = 0;
			for(int i = 30;i >= 0;i--){
				bool u = x >> i & 1;
				if(son[p][!u]) {
					ans = ans<<1|1;
					p = son[p][!u];
				}
				else{
					ans = ans<<1;
					p = son[p][u];
				}
			}
			return ans;
		}
	};
};
using TRIE::xor_Trie;

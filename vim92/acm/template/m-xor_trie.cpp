namespace TRIE{//0_idx  x<(2^31)
	const int SIZ = 100005*32;
	int son[SIZ][2],cnt[SIZ],idx;

	struct xor_Trie{

		xor_Trie(){
			idx = 0;
			init(idx);
		}

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
					init(idx);
				}
				p = son[p][u];
				cnt[p]++;
			}
		}

		void erase(const int &x){
			int p = 0;
			for (int i = 30; i >= 0; i--) {
				bool u = x >> i & 1;
				p = son[p][u];
				cnt[p]--;
			}
		}

		int findMaxXor(const int &x){
			int ans = 0;
			int p = 0;
			for(int i = 30;i >= 0;i--){
				bool u = x >> i & 1;
				if(son[p][!u] && cnt[son[p][!u]]) {
					ans |= 1 << i;
					p = son[p][!u];
				}
				else{
					p = son[p][u];
				}
			}
			return ans;
		}

		int findMinXor(const int &x){
			int ans = 0;
			int p = 0;
			for (int i = 30; i >= 0; i--) {
				bool u = x >> i & 1;
				if (son[p][u] && cnt[son[p][u]]) {
					p = son[p][u];
				}
				else {
					ans |= 1 << i;
					p = son[p][!u];
				}
			}
			return ans;
		}
	};
};
using TRIE::xor_Trie;

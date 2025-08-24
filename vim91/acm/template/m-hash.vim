namespace Hash{
	const unsigned long long base = 131,mod = 1e9+7;
	std::vector<unsigned long long>p(1,1),p2(1,1);

	template<typename T>
	struct hx{
		std::vector<unsigned long long>h;

		hx(){}
		hx(const T &s){
			init(s.size());
			h = std::vector<unsigned long long>(s.size()+1);
			for(int i = 0;i < s.size();i++){
				h[i+1] = h[i] * base + s[i];
			}
		}
		unsigned long long query(int l,int r){
			return h[r+1] - h[l]*p[r-l+1];
		}

		void init(int id){
			while(p.size() <= id){
				p.emplace_back(p.back()*base);
			}
		}
	};

	template<typename T>
	struct hx2{
		std::vector<unsigned long long>h,h2;

		hx2(){}
		hx2(const T &s){
			int n = s.size();
			init(s.size());
			h.resize(n+1);h2.resize(n+1);
			for(int i = 0;i < s.size();i++){
				h[i+1] = h[i]*base + s[i];
				h2[i+1] = (h2[i]*base + s[i]) % mod;
			}
		}

		std::pair<unsigned long long,unsigned long long> query(int l,int r){
			unsigned long long k1 = h[r+1] - h[l]*p[r-l+1];
			unsigned long long k2 = (h2[r+1] - h2[l]*p2[r-l+1]%mod + mod) % mod;
			return std::pair{k1,k2};
		}

		void init(int id){
			while(p.size() <= id){
				p.emplace_back(p.back()*base);
				p2.emplace_back(p2.back()*base%mod);
			}
		}
	};
};
using Hash::hx,Hash::hx2;

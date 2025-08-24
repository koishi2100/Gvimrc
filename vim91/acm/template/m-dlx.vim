struct DLX{
	int n,m,idx,ans;
	std::vector<int>first,siz,stk;
	std::vector<int>L,R,U,D;
	std::vector<int>col,row;

	void init(const int &r,const int &c){
		ans = 1e9;
		n = r,m = c;
		first.resize(n+1),siz.resize(m+1);
		L.resize(m+1),R.resize(m+1),U.resize(m+1),D.resize(m+1);
		col.resize(m+1),row.resize(m+1);
		for(int i = 0;i <= m;i++){
			L[i] = i-1,R[i] = i+1;
			U[i] = D[i] = i;
		}
		L[0] = m,R[m] = 0;
		idx = m+1;
	}

	void remove(const int &c){
		L[R[c]] = L[c],R[L[c]] = R[c];
		for(int i = D[c];i != c;i = D[i]){
			for(int j = R[i];j != i;j = R[j]){
				U[D[j]] = U[j];
				D[U[j]] = D[j];
				siz[col[j]]--;
			}
		}
	}

	void recover(const int &c){
		for(int i = U[c];i != c;i = U[i]){
			for(int j = L[i];j != i;j = L[j]){
				U[D[j]] = D[U[j]] = j;
				siz[col[j]]++;
			}
		}
		L[R[c]] = R[L[c]] = c;
	}

	bool dance(){
		if(stk.size() >= ans) return 0;
		if(!R[0]){
			ans = stk.size();
			return 1;
		}
		int c = R[0];
		for(int i = R[0];i != 0;i = R[i]){
			if(siz[i] < siz[c]) c = i;
		}
		remove(c);
		for(int i = D[c];i != c;i = D[i]){
			stk.push_back(row[i]);
			for(int j = R[i];j != i;j = R[j]){
				remove(col[j]);
			}
//			if(dance()) return 1;
			dance();
			for(int j = L[i];j != i;j = L[j]) {
				recover(col[j]);
			}
			stk.pop_back();
		}
		recover(c);
		return 0;
	}

	void remove2(const int &c){
		for(int i = D[c];i != c;i = D[i]){
			L[R[i]] = L[i]; R[L[i]] = R[i];
		}
	}

	void recover2(const int &c){
		for(int i = U[c];i != c;i = U[i]){
			L[R[i]] = R[L[i]] = i;
		}
	}

	int f(){
		int res = 0;
		std::vector<int>vis(m+1);
		for(int i = R[0];i != 0;i = R[i]){
			if(vis[i]) continue;
			vis[i] = 1;
			res++;
			for(int j = D[i];j != i;j = D[j]){
				for(int k = R[j];k != j;k = R[k]){
					vis[col[k]] = 1;
				}
			}
		}
		return res;
	}

	bool dance2(){
		if(stk.size() + f() >= ans) return 0;
		if(!R[0]) {
			ans = stk.size();
			return 1;
		}
		int c = R[0];
		for(int i = R[0];i != 0;i = R[i]){
			if(siz[i] < siz[c]) c = i;
		}
		for(int i = D[c];i != c;i = D[i]){
			for(int j = R[i];j != i;j = R[j]) remove2(j);
			remove2(i);
			stk.push_back(row[i]);
 			dance2();
//          if(dance2()) return 1;
			stk.pop_back();
			recover2(i);
			for(int j = L[i];j != i;j = L[j]) recover2(j);
		}
		return 0;
	}

	void insert(const int &r,const int &c){
		col.push_back(c),row.push_back(r);
		siz[c]++;
		U.push_back(c),D.push_back(D[c]);
		U[D[c]] = idx; D[c] = idx;
		if(first[r] == 0){
			first[r] = idx;
			L.push_back(idx),R.push_back(idx);
		}
		else{
			R.push_back(R[first[r]]);
			L[R[first[r]]] = idx;
			L.push_back(first[r]);
			R[first[r]] = idx;
		}
		idx++;
	}
};

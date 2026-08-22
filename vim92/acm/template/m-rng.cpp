auto SEED = std::chrono::steady_clock::now().time_since_epoch().count();
std::mt19937_64 rng(SEED);

template<typename T>
T rnd(const T &l, const T &r) { return rng() % (r - l + 1) + l; }

long long logi(long long a, long long b) {
    long long t = 0;
    long long v = 1;
    while (v < b) {
        v *= a;
        t++;
    }
    return t;
}

long long llog(long long a, long long b) {
    if (a <= b) {
        int l = logi(a, b);
        return (l == 0 ? 0 : std::__lg(2 * l - 1));
    }
	assert(b != 1);
    long long l = logi(b, a + 1) - 1;
    assert(l > 0);
    return -std::__lg(l);
}

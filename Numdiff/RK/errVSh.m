function errVSh(y0, t0, tf)
    n = 15;
    j = 1:n;
    err = zeros(1,n);
    f = @(t,y) -2*y;
    for k = j
        N = 10*2^k;
        [y, t] = RK4int(f, y0, t0, tf, N);
        err(k) = abs(y(end) - exp(-2*tf))
    end
loglog(2.^j, err);
end
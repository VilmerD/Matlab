%% 4.3
muv = [10 15 22 33 47 68 100 150 220 330 470 680 1000 10000 20000 100000];
N2 = zeros(1, length(muv));
for k = 1:length(muv)
    mu = muv(k);
    tvals = [0 0.7*mu]; y0 = [2;0];
    [t, y] = ode15s(@(t, y) vanderPol(t, y, mu), tvals, y0, 1e-9);
    N2(k) = length(t);
end
loglog(muv, N2);

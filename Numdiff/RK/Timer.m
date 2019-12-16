%% 4.2
mu = 100; y0 = [2; 0]; tvals = [0 0.7*mu];
muv = [10 15 22 33 47 68 100 150 220 330 470 680 1000];
N1 = zeros(1, length(muv));
for k = 1:length(muv)
    mu = muv(k);
    tvals = [0 0.7*mu]; y0 = [2;0];
    [t, y] = adaptiveRK34(@(t, y) vanderPol(t, y, mu), y0, tvals(1), tvals(2), 1e-7);
    N1(k) = length(t);
end
loglog(muv, N1);
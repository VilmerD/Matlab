function [y, t] = RK4int(f, y0, t0, tf, N)
h = (tf-t0)/N;

y = zeros(1, N+1);
t = zeros(1, N+1);
y(1) = y0;
t(1) = t0;
for k = 2:N+1
    y(k) = RK4step(f, y(k-1), t(k-1), h);
    t(k) = t(k-1) + h;
end
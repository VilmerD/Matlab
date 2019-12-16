function u = iterator(step, u, dt, d, a, M)
parts = 100;
n = floor(M/parts);
at = 2;
for j = 1:parts-1     %After every iteration print j indicating procentage of steps
    for k = at:at+n
        uold = u(:,k-1);
        u(:,k) = step(uold, dt, d, a);
    end
    at = at+n;
    j/parts
end
for k = at:M
    u(:,k) = step(u(:,k-1), dt, d, a);
end
1
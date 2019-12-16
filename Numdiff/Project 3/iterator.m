function u = iterator(step, u, dt, d, a, M)
parts = 10;
n = floor(M/parts);
at = 2;
for j = 1:parts-1     %After every iteration print j indicating procentage of steps
   j/parts
    for k = at:at+n
        u(:,k) = step(u(:,k-1), dt, d, a);
    end
    at = at+n;
end
for k = at:M
    u(:,k) = step(u(:,k-1), dt, d, a);
end
function animator(u, c, pt)
maxi = ceil(max(max(u)));
mini = floor(min(min(u)));
[N, M] = size(u);
xx = linspace(0,1,N);

c = 10;
pt = 0.01;
for k = 1:M/c;

    plot(xx, u(:,k*c), 'g');
    axis([0 1 mini maxi]);
    shg;
    
    pause(pt);
end
end
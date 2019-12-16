d = -0.001;
a = 1;
N = 700; Lx = 1;
xx = linspace(0,Lx,N+1);
xinner = xx(1:end-1);

M = 20000; tend = 10e-2;
dt = tend/M;
tt = 0:dt:tend;

%g = @(x) 2*sin(4*pi*x/Lx).*sin(3*pi*x/Lx) + 5*exp(-10*(x-0.5).^2);   
g = @(x) 4*cos(2*pi*x);
gx = g(xinner)';
% plot(xinner,gx);
u = [gx zeros(N,M)];

%%
u = iterator(@KDV, u, dt, d, a, M);
u = [u; u(1,:)];
animator(u, 1, 0.01);

%%
for k = 2:M+1
    uold = u(:,k-1);
    u(:,k) = KDV(uold, dt, d, a);
end
u = [u; u(1,:)];

[T, X] = meshgrid(tt, xx);
mesh(T, X, u);

%%
maxi = ceil(max(max(u)));
mini = floor(min(min(u)));
c = 10;
pt = 0.01;
% x = 300;
% ly = u(x,1);
% lx = xx(x);
for k = 1:length(tt)/c;
%     lx = [lx (x-k)/N];
%     ly = [u(x,k*c) ly];
%     plot(lx, ly, 'b-');

    plot(xx, u(:,k*c), 'g');
    axis([0 Lx mini maxi]);
    shg;
    
    pause(pt);
end
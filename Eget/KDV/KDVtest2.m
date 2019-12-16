d = 1;
N = 400; Lx = 1;
xx = linspace(0,Lx,N+1);
xinner = xx(1:end-1);

M = 10000; tend = 1;
dt = tend/M;
tt = 0:dt:tend;

g = @(x) exp(2*sin(1*pi*x/Lx).*sin(5*pi*x/Lx));   
gx = g(xinner)';
plot(xinner,gx);
uold = gx;

%% 
maxu = max(gx); minu = -max(gx);

c = 10; pt = 0.1;

x = 250;
xv = x/(N+1);
yv = g(xv);

w = 150; 
wv = w/(N+1);
yv2 = g(wv);
for k = 2:M+1
    utemp = KDV(uold, dt, d, a);
    unew = [utemp; utemp(1)]';
    
    yv = [unew(x) yv];
    xv = [xv (x-k)/(N+1)];
    
    yv2 = [unew(w) yv2];
    wv = [wv (w-k)/(N+1)];
    
    plot(xv, yv, wv, yv2);
    axis([0 1 minu maxu]);
    shg
    pause(pt);
    
    uold = utemp;
end
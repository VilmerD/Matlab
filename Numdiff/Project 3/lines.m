Nx = 20; Lx = 1;
xx = linspace(0,1,Nx+1);

M = 100;
tt = linspace(0, 1, M+1);

g = @(x) exp(-100*(x-0.5).^2);
gx = g(xx);

x = xx'*ones(1,M+1) + gx'*tt; 
x = min(x,1)
plot(x,tt);
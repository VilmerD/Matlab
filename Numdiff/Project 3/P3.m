%% Task 1.1
close all;

%% Spatial discretization
N = 40;
Lx = 1;
dx = Lx/(N+1);
xx = linspace(0, Lx, N+2);
xinner = xx(2:end-1);

%% Temporal discretization
tend = 0.3;
CFL = 7;
M = floor(tend/(dx^2*CFL));
dt = tend/M;
tt = linspace(0,tend,M+1);

%% Creating Tdx
Tdx = dx^-2*toeplitz([-2 1 zeros(1, N-2)]);

%% Initial conditions and boundry values
g = @(x) x.*(x-0.5).^4.*(x-1).^3;
gx = g(xinner)';

%% Euler and surfing
u = zeros(N, M+1);
u(:, 1) = gx;

u = steps(@eulerstep, u, M, dt, Tdx);
u = [zeros(1, M+1); u; zeros(1, M+1)];

[T, X] = meshgrid(tt, xx);
surf(T, X, u);
%% Task 1.2
close all;
%% Trapeziodal and surfing
u = zeros(N, M+1);
u(:, 1) = gx';

u = steps(@TRstep, u, M, dt, Tdx);
u = [zeros(1, M+1); u; zeros(1, M+1)];

[T, X] = meshgrid(tt, xx);
surf(T,X, u);

%% Task 2.1
close all;
clear all;

%% Speed
a = 3;

%% Spatial discretization
N = 400; Lx = 1;
dx = Lx/N;
xx = 0:dx:1;

%% Temporal discretization
tend = 0.1;
amu = 1;
dt = abs(amu*dx/a);
M = floor(tend/dt);

tt = 0:dt:dt*M;
%% Initial value
g = @(x) exp(-100*(x-0.5).^2);
xinner = xx(1:end-1);
gx = g(xinner)';

%% Lax and surf
u = [gx zeros(N, M)];

for k = 2:M;
    uold = u(:,k-1);
    u(:, k) = LaxWen(uold, amu);
end
u = [u; u(1,:)];


[T, X] = meshgrid(tt,xx);
surf(T,X,u);
shg

%% Task 3
close all;
clear all;
%% 
a = 3; d = 0.01;
Pe = abs(a/d);

%% Spatial
Nx = ceil(Pe/2) + 71;  Lx = 1;
dx = Lx/Nx; 

xx = 0:dx:Lx;
xinner = xx(1:end-1);

%% Temporal
M = 5000; tend = 1;
dt = tend/M;
tt = linspace(0,1,M);

%% Initial
g = @(x) exp(-100*(x-0.3).^2) + 3*exp(-400*(x-0.7).^2);
g0 = g(xinner)';

%% Solver
u = [g0 zeros(Nx,M-1)];

for k = 2:M
    uold = u(:,k-1);
    u(:,k) = convdif(uold, a, d, dt);
end
u = [u; u(1,:)];

[T, X] = meshgrid(tt,xx);
surf(T,X,u);

%% Task 4
close all;
clear all;

%% 
d = 0.01; 

%% Spatial
Nx = 400; Lx = 1;
xx = linspace(0,Lx,Nx);
xinner = xx(1:end-1);

%% Temporal
M = 2000; tend = 1;
dt = tend/M;
tt = linspace(0,tend,M);

%% Initial
%h = @(x) -8*(1-x.^7).^3./(1+exp(-100*(x-0.3)));
g = @(x) 4*(1-x.^4.4).^3./(1+exp(-100*(x-0.5)));
%g = @(x) 5.5*exp(-400*(x-0.5).^2);
%g = @(x) 5/2 + 1/2*sin(3*pi*xinner/Lx);
gx = g(xinner)';
plot(xinner, gx)
shg
%% Solver
u = [gx zeros(Nx-1,M-1)];

for k = 2:M
    uold = u(:,k-1);
    u(:,k) = burger(uold, d, dt);
    k
end
u = [u; u(1,:)];

[T, X] = meshgrid(tt, xx);
mesh(T,X,u);
shg
%% Animation
mx = ceil(max(max(u)));

ix = floor(min(min(u)));
for k = 1:length(tt)/2
    plot(xx, u(:,2*k));
    axis([0 1 ix mx]);
    shg
    pause(0.01);
end
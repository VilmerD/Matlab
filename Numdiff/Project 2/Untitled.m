%% 1.1
alpha = 0; beta = 0;
L = 1; N = 1000;
x = linspace(0, L, N+2)';

fvec = 6*x(2:end-1);

y = twopBVP(fvec, alpha, beta, L, N);
plot(x,y);

%% 1.1 error
N0 = 100:1000;
e = zeros(1, length(N0));

f = @(x) -(2*pi)^2*sin(2*pi*x);
fsol = @(x) sin(2*pi*x);

for k = 1:length(N0);
    N = N0(k)
    dx = 1/(N + 1);
    xinner = linspace(dx, L-dx, N)';
    fvec = f(xinner);
    y = twopBVP(fvec, alpha, beta, L, N);
    e(k) = norm([alpha; fsol(xinner); beta] - y)/sqrt(N+1);
end

loglog(1./(1 + N0), e);
shg
%% 1.2 
u0 = 0; ul = 0; m0 = 0; ml = 0;
L = 10;
N = 999;
x = linspace(0, L, N+2)';

q = -50e3;
M = twopBVP(q, m0, ml, L, N);

I = 1e-3*(3-2*cos(pi*x(2:end-1)/L).^12);
u = twopBVP(M(2:end-1)./(I*1.9e11), u0,ul,L,N);
u((N+3)/2)

%% 2.1
N0 = 10:1000;
d = zeros(length(N0), 3);
for k = 1:length(N0);
    N = N0(k)
    dx = 1/(N+1);
    A = dx^-2*toeplitz([-2 1 zeros(1,N-2)]);
    [V, D] = eig(A);
    f3 = D(end-2:end, end-2:end);
    Real = diag(pi^2*[-9 -4 -1]);
    d(k,:) = diag(f3-Real)';
end
%loglog(1./(1 + N0),d(:,1), 'r');
loglog(1./(1 + N0),d(:,2), 'b');
%loglog(1./(1 + N0),d(:,3), 'g');

%% 2.1.1
N = 499;
dx = 1/(N+1);
A = dx^-2*toeplitz([-2 1 zeros(1,N-2)]);
[V, D] = eig(A);
f32 = D(end-2:end, end-2:end)

hold on;
x = linspace(0,1,N+2);
for i = 1:3
    eigv = [0; V(:,end-i+1); 0];
    plot(x, eigv);
end

%% 2.2
N = 499;
V = zeros
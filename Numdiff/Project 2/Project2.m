%% 1.1
alpha = 0; beta = 0;
L = 1; N = 1000;
x = linspace(0, L, N+2)';
xinner = x(2:end-1);

fvec = -4*pi^2*sin(2*pi*xinner);

y = [alpha; twopBVP(fvec, alpha, beta, L, N); beta];
x1 = linspace(0, L, 70);
plot(x,y, 'r', x1, sin(2*pi*x1), '--k');
legend("Numerical solution", "Exact solution");

alpha = 1; beta = 0;
L = 1;

fvec = -(3*pi/2)^2*cos(3*pi*xinner/2);
y2 = [alpha; twopBVP(fvec, alpha, beta, L, N); beta];
plot(x, y2,  'r', x1, cos(3*pi*x1/2), '--k'); 
legend("Numerical solution", "Exact solution");

%% 1.1 error
N0 = 100:1000;
e = zeros(1, length(N0));

f = @(x) -(2*pi)^2*sin(2*pi*x);
fsol = @(x) sin(2*pi*x);

for k = 1:length(N0);
    N = N0(k);
    x = linspace(0, L, N+2)';
    xinner = x(2:end-1);
    fvec = f(xinner);
    y = [alpha; twopBVP(fvec, alpha, beta, L, N); beta];
    e(k) = norm(fsol(x) - y)/sqrt(N+1);
end

loglog(1./(1 + N0), e);
ylabel("error");
shg
%% 1.2 
u0 = 0; ul = 0; M0 = 0; Ml = 0;
L = 10;
N = 999;

x = linspace(0, L, N+2)';
xinner = x(2:end-1);

q = -50e3;
M = twopBVP(q, M0, Ml, L, N);

I = 1e-3*(3-2*cos(pi*xinner/L).^12); E = 1.9e11;
u = [0; twopBVP(M./(I*E), u0, ul, L, N); 0];
u((N+1)/2)
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

%% 2.2.1
N = 499;
pot = zeros(N,1);
[V, D] = schrodinger(pot, N, [1 6]);
s = pi^2*[6 5 4 3 2 1].^2;
D./s'

%% 2.2.2
N = 499;
x = linspace(0,1,N);
pot = 700*(0.5-abs(x-0.5));
schrodinger(pot, N, [1 4]);
shg

%% 2.2.3
N = 1500;
x = linspace(0,1,N);
pot = 8000*sin(11*pi*x).^2;
[V, D] = schrodinger(pot, N, 2);
shg

%% 2.2.triplet
N = 1000;
x = linspace(0,1,N);
pot = 800*sin(4*pi*x).^2;
schrodinger(pot, N, [1 4]);

plot(x, pot);
%% 2.2 Dirac
N = 1000;
x = linspace(0,1,N);
pot = 1000*(exp(-3e2*(x-0.25).^2) + exp(-3e2*(x-0.75).^2));
schrodinger(pot, N, [6 8]);

%% 2.2 Knas
N = 1000;
x = linspace(0,1,N);
pot = [zeros(1,200) 300 + 10*(1:1:100) 1300*ones(1,100)  300*ones(1,200) 1300*ones(1,100) 1300 - 10*(1:1:100) zeros(1,200)];
schrodinger(pot, N, [6 12]);

%% 2.2 Knas2.0
N = 1000;
x = linspace(0,1,N);
pot = [5000:-10:1000 zeros(1,198) 1000:10:5000];
schrodinger(pot, N, [5,11]);
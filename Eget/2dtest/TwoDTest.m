%% Initializing
N = 400;
xx = linspace(0,1,N);
yy = xx';
[X,Y] = meshgrid(xx,yy);
%% Matrix
s = (mod(1:(N^2-1),N)~=0);
superRow = double(s);

super = spdiags([1 superRow]', 1, N^2, N^2);
sub = spdiags([superRow 1]', -1, N^2, N^2);
superduper = spdiags(ones(N^2,1), N, N^2, N^2);
suberduper = spdiags(ones(N^2,1), -N, N^2, N^2);
diagonal = -4*speye(N^2);

M = -N^2*(super + superduper + sub + suberduper + diagonal);
%% Initial function 
f = @(x,y) 10*exp(-100*(x-y).^2);
xmesh = X(:);

ymesh = Y(:);

fm = f(xmesh,ymesh);
%% Boundary matricies
westC = sparse((mod(1:N^2,N) == 1)');
westM = spdiags(westC, 0, N^2, N^2);

northC = sparse((1:N^2 < N+1)');
northM = spdiags(northC, 0, N^2, N^2);

eastC = sparse((mod(1:N^2,N) == 0)');
eastM = spdiags(eastC, 0, N^2, N^2);

southC = sparse((1:N^2 > N^2 - N)');
southM = spdiags(southC, 0, N^2, N^2);
%% Boundary Values
alpha = [0 1 0 0]; beta = [1 1 0 0];    %0x 1x y0 y1 
beta = beta.*(-1).^(0:3);

g1 = @(x) exp(sin(3*pi*x));
g2 = @(x) exp(-100*(x-0.5).^2);
g3 = @(x) 0;
g4 = @(x) 0;

z = find(abs(alpha) + abs(beta) == 0);
alpha(z) = ones(1, length(z));

B = 2./(alpha - N*beta); Bt = B.*(alpha+N*beta)/2;                          %   -||-

BndryF = (g1(xmesh).*westC*B(1) + g2(xmesh).*eastC*B(2) + g3(ymesh).*northC*B(3) + g4(ymesh).*southC*B(4))*N^2;
BndryM = (westM*Bt(1) + eastM*Bt(2) + northM*Bt(3) + southM*Bt(4))*N^2;
%% L�sning
y = sparse(M + BndryM)\(fm + BndryF);
ym = reshape(y, [N,N]);
mesh(X,Y,ym);
xlabel("x");
ylabel("y");
shg
%% Initializing
N = 120;
xx = linspace(0,1,N+2); xinner = xx(2:end-1);
yy = xx';                yinner = xinner';
[X,Y] = meshgrid(xinner,yinner);

%% Matrix
s = (mod(1:(N^2-1),N)~=0);
super = double(s);

M = sparse(-2*diag(ones(1,N^2)) + diag(super,1) + diag(super,-1) + diag(ones(1,N^2-N),N) + diag(ones(1,N^2-N), -N));
%% Initial function 
f = @(x,y) sin(3*pi*y).^2.*y.*x.*sin(3*pi*x).^2;
fm = f(xinner,yinner);              % Matrix
finner = fm(:);                     % Vector

%% L�sning
y = M\finner;
ym = reshape(y, [N,N]);
ym = [zeros(1,N+2); zeros(N,1) ym zeros(N,1); zeros(1,N+2)];
[X,Y] = meshgrid(xx,yy);
mesh(X,Y,ym);
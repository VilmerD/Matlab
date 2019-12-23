%% Initializing
N = 190;
xx = linspace(0,1,N+2); xinner = xx(2:end-1);
yy = xx';                yinner = xinner';

%% Matrix
s = (mod(1:(N^2-1),N)~=0);
super = double(s);

M = sparse(-2*diag(ones(1,N^2)) + diag(super,1) + diag(super,-1) + diag(ones(1,N^2-N),N) + diag(ones(1,N^2-N), -N));

%% Initial function 
f = @(x,y) sin(x.*y*pi).*cos(x.*y*pi);
fm = f(xinner,yinner);              % Matrix
finner = fm(:);                     % Vector

%% 
y = M\finner;
ym = reshape(y, [N,N]);
ym = [zeros(1,N+2); zeros(N,1) ym zeros(N,1); zeros(1,N+2)];
[X,Y] = meshgrid(xx,yy);
mesh(X,Y,ym);
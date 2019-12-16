N = 600; Lx = 1;
dx = Lx/(N + 1);
xx = 0:dx:1;
xinner = xx(2:end-1);
zero = zeros(1, N-3);

f = @(x) 16*(x-1).^2.*x.^2;
ftrpl = @(x) 16*(24*x-12);
fx = ftrpl(xinner)';

%TRp = dx^-3*toeplitz([0 -a' zeros(1, N-4)], [0 a' zeros(1,N-4)]);
TR = dx^-3*toeplitz([0 1 -1/2 zero], [0 -1 1/2 zero]) + diag(dx^-3*[-0.5 zero 0 0.5]);

u = TR\fx;
%u2 = TRp\fx;
u = [0; u; 0];
%u2 = [0; u2; 0]/max(u2);
plot(xx, u, xx, f(xx), 'r');
%plot(xx, u2); 

%% 
NS = 900:1200;
error = zeros(1,length(NS));
k = 0;
for n = NS
    k = k+1
    zero = zeros(1,n-3);
    TR = dx^-3*to
    eplitz([0 1 -1/2 zero], [0 -1 1/2 zero]) + diag(dx^-3*[-0.5 zero 0 0.5]);
    
    xx = linspace(0,1,n+2)';
    xinner = xx(2:end-1);
    fx = ftrpl(xinner);
    
    u = TR\fx;
    error(k) = norm(u - f(xinner))/sqrt(n+1);
end

N = 1./(NS + 1);
semilogy(N, k);
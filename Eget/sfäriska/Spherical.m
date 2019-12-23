N = 10; 
xx = linspace(0,1,N+1);
xinner = xx(2:end);

%% 
super = (1 + 1./(1:(N-1)));
sub = (1 - 1./(2:N));
M = N^2*(diag(super, 1) - 2*diag(ones(1,N)) + diag(sub,-1));
%% 
[V, D] = eig(M);
V = [zeros(1,N); V];
plot(xx, V(:,end-1));
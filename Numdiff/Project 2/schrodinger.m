function [Vnorm ,E] = schrodinger(V, N, nvalues)
dx = 1/(1 + N);
T = dx^(-2)*toeplitz([-2 1 zeros(1, N-2)]);
A = T - diag(V);
[Vtot, Dtot] = eig(A,'vector');
nvals = nvalues(2)-nvalues(1);

Vtot = [zeros(1,N); Vtot; zeros(1,N)];

x = linspace(0, 1, N+2);
hold on;
Vnorm = zeros(N+2, nvals);
E = zeros(nvals,1);
k = 0;
for i = nvalues(1):nvalues(2)
    k = k+1;
    eigv = Vtot(:,end-i+1);
    E(k) = -Dtot(end-i+1);
    normv = norm(eigv);
    
    eigvnorm = eigv/normv; 
    probnorm = eigvnorm.^2;
    Evec = E(k) * ones(1, N+2);
    plot(x, Evec + 10000.*probnorm, x, Evec, '--');
    Vnorm(:,k) = eigvnorm;
end
end
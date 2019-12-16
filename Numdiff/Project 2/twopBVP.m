function y = twopBVP(fvec, alpha, beta, L, N);
dx = L/(N+1);
zero = zeros(N-2, 1);
BV = [alpha; zero; beta];

T = sparse(toeplitz([-2 1 zero']));
F = -BV + fvec*dx^2;
y = T\F;
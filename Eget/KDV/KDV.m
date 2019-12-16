function unew = KDV(uold, dt, d, a)
N = length(uold);

zero = zeros(1, N-5);
TR = N^3*toeplitz([0 1 -1/2 zero 1/2 -1], [0 -1 1/2 zero -1/2 1]);
T = N^2*toeplitz([-2 1 zero 0 0 1]);
S = N*toeplitz([0 -1 zero 0 0 1], [0 1 zero 0 0 -1]);

unew = (eye(N) - dt*d/2*TR)\(a*LW(uold, T, S, dt) + dt*d/2*TR*uold);
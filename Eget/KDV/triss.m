function unew = triss(uold, dt)
N = length(uold);
dx = 1/N;
zero = zeros(1, N-5);
TR = dx^(-3).*toeplitz([0 1 -1/2 zero 1/2 -1], [0 -1 1/2 zero -1/2 1])
unew = TR*uold;
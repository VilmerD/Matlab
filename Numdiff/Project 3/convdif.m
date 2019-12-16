function unew = convdif(uold, a, d ,dt)
N = length(uold);

T = d*N^2*toeplitz([-2 1 zeros(1,N-3) 1]);

first = [0 -1 zeros(1,N-3) 1];
S = a*N/2*toeplitz(first, -first);

F = dt.*(T - S)/2;
I = eye(N);
unew = (I - F)\(I + F)*uold;
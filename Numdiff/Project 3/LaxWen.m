function unew = LaxWen(u, amu)
N = length(u);
firstCol = [1-amu^2, amu/2*(1+amu), zeros(1, N-3), -amu/2*(1-amu)];
firstRow = [1-amu^2, -amu/2*(1-amu), zeros(1, N-3), amu/2*(1+amu)];
S = toeplitz(firstCol, firstRow);
unew = S*u;
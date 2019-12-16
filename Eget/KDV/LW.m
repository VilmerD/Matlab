function unew = LW(uold, T, S, dt)
N = length(uold);
uprime = S*uold;
udblprime = T*uold;

unew = uold.*((ones(N,1) - dt*(uprime) + 2*dt^2*uprime.^2 + (dt^2)*uold.*udblprime));
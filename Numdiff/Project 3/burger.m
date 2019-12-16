function unew = burger(uold, d, dt)
    N = length(uold);                     %%  Creating the T-matrix
    zero = zeros(1,N-3);                  %%  responsible for discretizing
    T = N^2*toeplitz([-2 1 zero 1]);      %%  the second derivative
    
    firstR = [0 -1 zero 1];               %% Creating the S-matrix  
    firstC = -firstR;                     %% responsible for discretizing
    S = N/2*toeplitz(firstC, firstR);     %% the first derivative
    
    I = eye(N);
    
    unew = (I-dt*d/2*T)\(LW(uold, T, S, dt) + dt*d/2*T*uold);
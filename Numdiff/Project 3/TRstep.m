function unew = TRstep(Tdx, uold, dt);
T = dt/2.*Tdx;
I = eye(size(T));
unew = (I-T)\(I+T)*uold;
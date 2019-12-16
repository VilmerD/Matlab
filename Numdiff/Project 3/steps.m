function u = steps(step, u, M, dt, Tdx)
   for k = 2:M+1
       uold = u(:,k-1);
       u(:,k) = step(Tdx, uold, dt);
   end
end
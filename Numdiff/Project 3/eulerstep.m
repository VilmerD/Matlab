function unew = eulerstep(Tdx, uold, dt)
unew = uold + Tdx*uold*dt;
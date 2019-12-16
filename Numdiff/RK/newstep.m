function hnew = newstep(tol, err, errold, hold, k)
hnew = (tol/err)^(2/(3*k)) * (tol/errold)^(-1/(3*k))*hold;
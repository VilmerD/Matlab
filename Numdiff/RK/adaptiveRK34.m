function [t, y] = adaptiveRK34(f, y0, t0, tf, tol)
    h = abs(tf - t0)*tol^(0.25) /(100*(1 + norm(f(t0,y0))));
    errold = tol;
    t(1) = t0;
    y(:,1) = y0;
    k = 2;
    while h < (tf-t(k-1))
        [ynew, err] = RK34step(f, y(:,k-1), t(k-1), h);
        y(:,k) = ynew;
        t(k) = t(k-1) + h;
        h = newstep(tol, norm(err), norm(errold), h, 4);
        errold = err;
        k = k + 1;
    end
    h = tf - t(k-1);
    [y(:,k), ~] = RK34step(f, y(:,k-1), t(k-1), h);
    t(k) = tf;
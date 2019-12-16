function [unew, err] = RK34step(f, uold, told, h)
    Y1 = f(told, uold);
    Y2 = f(told + 0.5*h,uold + 0.5*h*Y1);
    Y3 = f(told + 0.5*h,uold + 0.5*h*Y2);
    Z3 = f(told + h, uold - h*Y1 + 2*h*Y2);
    Y4 = f(told + h, uold + h*Y3);

    unew = uold + h*(Y1 + 2*Y2 + 2*Y3 + Y4)/6;
    err = h/6*(2*Y2 + Z3 - 2*Y3 - Y4);
end


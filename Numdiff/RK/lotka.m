function dudt = lotka(t,u)
    a = 3;
    b = 9;
    c = 15;
    d = 15;
    
    dudt = [a*u(1) - b*u(1)*u(2); c*u(1)*u(2) - d *u(2)];

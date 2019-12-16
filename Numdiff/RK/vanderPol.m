function dudt = vanderPol(t, u, mu)
dudt = [u(2); mu*(1-u(1)^2)*u(2) - u(1)];
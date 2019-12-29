function unew = Newtonstep(uold, f, fprime);
unew = uold - f(uold)/fprime(uold);
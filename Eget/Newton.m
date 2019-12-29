function app = Newton(f, fprime, N, guess)
if nargin < 4
    guess = 0;
end

for k = 1:N
    app = Newtonstep(guess, f, fprime);
    guess = app;
end
y0 = [1; 1];
[t,y] = adaptiveRK34(@(t, y) lotka(t,y), y0, 1, 10, 1e-12);
hold on;
plot(t, y(1,:), 'g', t, y(2,:), 'r');
plot(y(1,:), y(2,:), 'bl');
% Perioden är ungefär 9.1/8 = 1.14
% Om begynnelsevärdena ändras så ändras perioden och lösningen drastiskt
%%
hold off;
[t,y] = adaptiveRK34(@(t, y) lotka(t,y), y0, 1, 3000, 1e-8);
H = @(x, y) 15*x + 9*y - 15*log(x) - 3*log(y);
semilogy(t, abs(H(1,1)./H(y(1,:),y(2,:)) - 1)); 
xlabel("Time"); ylabel("Absolute value of (H(1,1)/H(x,y) - 1)");
% the plot should definately be linlog, as usual we want the logarithm of
% the error, and a linear time (obviously)
%% 4.1  
mu = 100; y0 = [2; 10]; tvals = [0 2*mu];
%[t1, y1] = ode45(@(t,y) vanderPol(t,y,mu), tvals, y0);
[t2, y2] = adaptiveRK34(@(t,y) vanderPol(t,y,mu), y0, tvals(1), tvals(2), 1e-5);
%plot(t, y(2,:));

%plot(y1(:,1), y1(:,2), 'bl');
%plot(t2,y2(2,:));
plot(y2(1,:), y2(2,:), 'g'); 
xlabel("y1"); ylabel("y2");
%% 4.2
y0 = [2;0];
muv = [10 15 22 33 47 68 100 150 220 330 470 680 1000];
N1 = zeros(1, length(muv));
for k = 1:length(muv)
    mu = muv(k);
    tvals = [0 0.7*mu];
    [t, y] = adaptiveRK34(@(t, y) vanderPol(t, y, mu), y0, tvals(1), tvals(2), 1e-7);
    N1(k) = length(t);
end
loglog(muv, N1);
xlabel("mu"); ylabel("Number of iterations required to reach tolerance 1e-7");
%% 4.3
y0 = [2;0];
muv = [10 15 22 33 47 68 100 150 220 330 470 680 1000 10000 20000 100000];
N2 = zeros(1, length(muv));
for k = 1:length(muv)
    mu = muv(k);
    tvals = [0 0.7*mu];
    [t, y] = ode15s(@(t, y) vanderPol(t, y, mu), tvals, y0, 1e-9);
    N2(k) = length(t);
end
loglog(muv, N2);
xlabel("Mu"); ylabel("Number of iterations required to reach tolerance 1e-9");
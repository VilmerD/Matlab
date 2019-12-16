%% Arbetsspänning
x = [300 330 340 360 390 420 450 480 510 540 570 600];
y = [0 0 2461 2296 2440 2405 2472 2550 3164 4398 5625 6988]./30;

plot(x,y)
xlabel('Spänning [V]'); ylabel('Den genomsnittliga aktiviteten under 30 sekunder [Bq]');
saveas(gcf, 'Arbetsspänning', 'jpg');
%% Dödtid
n1 = 59815/300;
n2 = 45353/300;
nb = 335/300;
n12 = 91046/300;

X = n1*n2 - nb*n12;
Y = n1*n2*(n12+nb) - n12*nb*(n1+n2);
Z = Y*(n1 + n2 - nb - n12)/X^2;

tau = X*(1-sqrt(1-Z))/Y;

%% Effektiviteten
theta = 0.0093;
R = 0.0396;
I = 157e-6*37e9*exp(-45*log(2)/30.08);
n = 4639; n0 = 292;

w = pi*(theta/(2*R))^2;
er = 4*pi/(I*w)*((n/(1-n*tau)) - (n0/(1-n0*tau)))

%% Silver
load('TeamVR.mat');
y = TeamVR.VarName2;
x = TeamVR.v;
plot(x, y/10,'k.');
hold on

a =       136.7;
b =    0.004717;
c =       613.7;
d =     0.02912;
f =        4.65;
y1 = (a*exp(-b.*x) + c*exp(-d.*x) + f)*0.1;
plot(x, y1, 'b-');

xlabel('Tid [s]'); ylabel('Aktivitet [Bq]');
legend('Uppmätt aktivitet', 'Anpassad exponentialfunktion');
shg

saveas(gcf, "Aktivitet", 'jpg');

T1 = log(2)/b
T2 = log(2)/d

a = 136.7; c = 613.7;
kc = 0.5135; ka = 0.4865;

T = 22*60 + 20;

q = kc*(1-exp(-d*T))*c/(ka*(1-exp(-b*T))*a)
weight = 1./y;
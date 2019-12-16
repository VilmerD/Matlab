%% a) Simulera det mekaniska systemet, plotta hastighet och position
k = 25000;
g = 9.8;
m = 5;
M = 75;
c = 250;
simtime = 3;

optionvec1 = simset('AbsTol', 1e-9, 'RelTol', 1e-6);
optionvec2 = simset(optionvec1, 'MaxStep', simtime/500);

time1 = sim('ModellStolVDahlberg', simtime, optionvec2);
yout.Name = 'yout';
yout2.Name = 'yout2';
x1 = yout.Data;
x2 = yout2.Data;

plot(time1,x1.*100, time1,x2);

title('Position and velocity of the chair');
legend('Deviation from the rest position [cm]', 'Velocity of the chair [m/s]');
xlabel('Time [s]');
shg

%% b) + c) Simulera den elektriska kretsen och försök att få samma insvängning som det mekaniska systemet
% Gamma bestämdes genom att beräkna slutvärdet hos de två systemen med
% slutvärdesteoremet, och sedan sätta dem lika. 

% Beta, eller vad jag har kallat 'scale', bestäms enkelt genom att kräva att 
% systemen skall vara lika snabba efter skalning med beta. Låt snabbheten hos
% det mekaniska systemet vara omega_m och snabbeheten hos det elektriska
% systemet vara omega_e, då får vi beta genom sambandet:
% omega_e / beta = omega_m

C = 1e-4;
L = 1.5e-6;

omega_m = sqrt(k/(m+M)); omega_e = (L*C)^(-0.5);

scale = omega_e / omega_m

gamma = M*g/(k*C);
Rx = sqrt(L/(C*k*(m+M)))*c;

time2 = sim('ModellKretsVDahlberg', simtime/scale, optionvec2);
meat.Name = 'meat';
z1 = meat.Data;

plot(time1,x1.*100, 'k-', time2.*scale,z1*100, 'ro');
title(['Beta/scale = ',num2str(scale)]);
legend('Step response of the mechanical system',...
    ['Step response of the electrical circuit, scaled in time by ', num2str(scale)]);
shg
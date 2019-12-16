e0 = 1.6022e-16; a0 = 0.05292e-9; epsilon0 = 8.854e-12; Z = 3;

r = 0:1e-12:2*a0;
v1 = (Z*r/a0 + 1).*exp(-2*Z*r/a0);
v2 = (1-v1);
V = v2.*e0^2./(4*pi*epsilon0*r);
plot(r,V);
xlabel('Distance from origo / m'); ylabel('Potential from electrons / V');
saveas(gcf, 'Potential', 'jpg');
shg;
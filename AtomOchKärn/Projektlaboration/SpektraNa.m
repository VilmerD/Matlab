load('Na222');

h = Na222(:,2);
h0 = erase(h, ';');
h1 = replace(h0, ',', '.');
h2 = str2double(h1);
h3 = max(h2, 0);

v1 = erase(Na222(:,1), ';');
v2 = replace(v1, ',', '.');
v3 = str2double(v2);

plot(v3(800:2094), h3(800:2094));
xlabel("Wavelength /nm"); ylabel("Counts");
saveas(gcf, 'SpektraNa_2', 'jpg');
shg


%%
load('CdDarkNosat');

cdy = CdDarkNosat(:,5);
cdy = extractAfter(cdy,4);
cdy = str2double(cdy);

cdy2 = CdDarkNosat(:,6);
cdy2 = str2double(cdy2);

cdy = cdy + 1e-5*cdy2.*sign(cdy);

cdx = CdDarkNosat(:,1);
cdx = str2double(cdx);

cdx2 = CdDarkNosat(:,2);
cdx2 = extractBefore(cdx2, 3);
cdx2 = str2double(cdx2(:,1));

cdx = cdx + 0.01*cdx2;

plot(cdx,cdy);
xlabel("Wavelength, nm"); ylabel("Counts, 1");
saveas(gcf, "Cd_Med_Dark", 'jpg');
shg
%%
Cdpeaks = [340.34 346.6 346.73 361.02 361.25 361.41];

hold on
for j = 1:length(Cdpeaks) 
    Cdtemp = Cdpeaks(j);
    Cdamp = cdy(cdx == Cdtemp);
    
    text1 = num2str(Cdtemp);
    text2 = num2str(Cdamp);
    t = text1 + "nm, " + text2 + "cnts";
    
    text(Cdtemp, Cdamp + 2e2, t);
    plot(Cdtemp, Cdamp, 's');
end
plot(cdx,cdy);
xlabel("Wavelength, nm"); ylabel("Counts, 1");
saveas(gcf, "Cd_Med_Dark", 'jpg');
shg

%% CdDark
load('CdDark');

cddy = CdDark(:,4);
cddy = extractAfter(cddy,6);
cddy = replace(cddy, ',', '.');
cddy = str2double(cddy);

cddx = CdDark(:,1);
cddx = erase(cddx, ';');
cddx = replace(cddx, ',', '.');
cddx = str2double(cddx);

plot(cddx,cddy);
xlabel("Wavelength, nm"); ylabel("Counts, 1");
saveas(gcf, "Cd_Med_Dark", 'jpg');
shg

Cdpeaks = [340.34 346.6 346.73 349.97 361.02 361.25 361.41];
hold on
p1 = relint(340.12, 340.50, cddx, cddy);
p2 = relint(346.52, 346.67, cddx, cddy);
p3 = relint(346.67, 346.79, cddx, cddy);
p4 = relint(349.93, 350.02, cddx, cddy);
p5 = relint(360.94, 361.1, cddx, cddy);
p6 = relint(361.18, 361.33, cddx, cddy);
p7 = relint(361.38, 361.45, cddx, cddy);

p = [p1 p2 p3 p4 p5 p6 p7];
for j = 1:length(Cdpeaks) 
    Cdtemp = Cdpeaks(j);
    Cdamp = cddy(cddx == Cdtemp);
    
    text1 = num2str(Cdtemp);
    text2 = num2str(p(j));
    t = text1 + "nm, " + text2 + "cnts";
    
    text(Cdtemp, Cdamp + 1e3, t);
    plot(Cdtemp, Cdamp, 's');
end
plot(cddx,cddy);
xlabel("Wavelength, nm"); ylabel("Counts, 1");
saveas(gcf, "Cd_Med_Dark", 'jpg');
shg


%% Na spektrum
hold off
load('NaDarkSat');

na1 = NaDarkSat(:,5);
na1 = extractAfter(na1,4);
na1 = str2double(na1);

na2 = NaDarkSat(:,6);
na2 = str2double(na2);

nay = na1 + 1e-5*na2.*sign(na1);

nax1 = NaDarkSat(:,1);
nax1 = str2double(nax1);

nax2 = NaDarkSat(:,2);
nax2 = extractBefore(nax2, 3);
nax2 = str2double(nax2(:,1));

x = nax1 + 0.01*nax2;

nax0 = [434.31 466.55 474.97 498.03 515.18 568.64 615.93];
y0 = [5000 5000 10000 14000 5000 15000 28000 6000];

hold on
for l = 1:length(nax0)
    xtemp = nax0(l);
    %text(xtemp, y0(l), num2str(xtemp));
    plot(xtemp, nay(x == xtemp), 's');
end
plot(x(800:2100),nay(800:2100));
xlabel("Wavelength, nm"); ylabel("Counts, 1");
saveas(gcf, "Na_Med_Dark", 'jpg');
shg

%%
h = 6.626e-34; c = 299792458; E_0 = 5.14 - h*c/(589.51e-9)/1.6022e-19;
n = [10 6 7 5 6 4 5];
l = ['s' 'd' 's' 'd' 's' 'd' 's'];
konf = ['10s' '6d' '7s' '5d' '6s' '4d' '5s'];


delE = h*c./nax0 /1.6022e-19*1e9;
E_n = E_0 - delE;

nstar = sqrt(13.606./E_n);

delta = n - nstar;

s = delta(l == 's');
d = delta(l == 'd');
p = delta(l == 'p');

deltaS = s * ones(length(s), 1)/length(s)
deltaD = d * ones(length(d), 1)/length(d)
deltaP = p * ones(length(p), 1)/length(p)
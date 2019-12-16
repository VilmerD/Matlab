odd = logical(mod(1:12, 2));
even = ~odd;
d = 3.085e-3;
TA = 0.1;
h = 6.626e-34;
c = 299792458;
mub = 9.274009e-24;

%% Blue
blue = 2*[339022398 360586643 339368850 360260040 337494731 363388062 333923101 364752352 327987164 368791491 326347947 371532023].*1e-15;
bnb = 2*[272829324 364385754]*1e-15;
bluex = [131 182 268 297 352 400]*1e-2*TA;

bi = blue(odd);
by = blue(even); 

dsigmablue = ds(bi, by, bnb(1), bnb(2), d);


%pb = polyfit(bluex(2:end), dsigmablue(2:end), 1);
pb = polyfit(bluex, dsigmablue, 1);
%polyx = linspace(bluex(2), bluex(end));
polyx = linspace(bluex(1), bluex(end));

%plot(bluex(2:end), dsigmablue(2:end), 'b', polyx, polyval(pb, polyx), 'b.');
plot(bluex, dsigmablue, 'b', polyx, polyval(pb, polyx), 'b.');

hold on;

dmjb = 2;
gjb = gj(1, 0, 1);

%Bb = linspace(bluex(2),bluex(end));
Bb = linspace(bluex(1),bluex(end));

dsigmab = gjb*mub*dmjb*Bb/(h*c);
plot(Bb, dsigmab,'g.');
xlabel("B [T]"); ylabel("Deltanu [m]");
legend("Mätvärden", "Minsta-kvadrat anpassning", "Teoretiska värden", 'Location', 'northwest');

%% Red
red = 2*[228286609 243001267 224168047 246419519 221299708 250285208 218513697 251508385 215059504 257586867 211600006 254460871]*1e-15;
rnb = 2*[235054761 425667107]*1e-15;
redx = [185 240 275 325 373 400]*1e-2*TA;

ri = red(odd);
ry = red(even);

dsigmared = ds(ri, ry, rnb(1), rnb(2), d);

%pr = polyfit(redx(1:end-1), dsigmared(1:end-1), 1);
%polyrx = linspace(redx(1), redx(end-1));

pr = polyfit(redx, dsigmared, 1);
polyrx = linspace(redx(1), redx(end));

%plot(redx(1:end-1), dsigmared(1:end-1),'r', polyrx, polyval(pr, polyrx), 'r.');
plot(redx(1:end), dsigmared(1:end),'r', polyrx, polyval(pr, polyrx), 'r.');
hold on;

dmjr = 2;
gjr = 1;

%Br = linspace(redx(1), redx(end-1));
Br = linspace(redx(1), redx(end));
dsigmar = gjr*mub*dmjr*Br/(h*c);

plot(Br, dsigmar, 'm.');
xlabel("B [T]"); ylabel("Deltanu [m]");
legend("Mätvärden", "Minsta-kvadrat anpassning", "Teoretiska värden", 'Location', 'northwest');


%%
pb(1)/pr(1)

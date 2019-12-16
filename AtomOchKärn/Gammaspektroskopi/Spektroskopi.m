k = 1173.228/994;
l = 1:2049;

%Cs137________________________________________
subplot(4,1,1);
load('Cs137');
plot(l.*k, log(Cs137/300),...
    676,6,'rs');
xlabel('Energi / keV'); ylabel('log(Counts/s) / log(Bq)');

text(674, 8, '676 keV');
title('Cs137');

%Co60__________________________________________
subplot(4,1,2);
load('Co60');
plot(l.*k, log(Co60/300),...
    1172, -0.61, 'rs',...
    1325, -0.8, 'rs');
xlabel('Energi / keV'); ylabel('log(Counts/s) / log(Bq)');

text(1100, 2, '1173 keV');
text(1300 , 1.6, '1332 keV');
title('Co60');

%Na22___________________________________________
subplot(4,1,3);
load('Na22');
plot(l.*k, log(Na22/300), ...
    523 , 3.9, 'rs',...
    1272, 1.8, 'rs',...
    1822, -2.4457, 'rs');
xlabel('Energi / keV'); ylabel('log(Counts/s) / log(Bq)');

text(422, 5, '523 keV');
text(1272, 3, '1272 keV');
text(1800, -1, '1822 keV');
title('Na22');

%Th______________________________________________
subplot(4,1,4);
load('Th');
plot(l.*k, log(Th/300),...
    246, 1.3, 'rs',...
    340, 0.37, 'rs',...
    591, 0.0551, 'rs',...
    911.3, -0.5798, 'rs',...
    954, -.8286, 'rs',...
    464, -0.35, 'rs',...
    507, -0.0548, 'rs'...
    );
xlabel('Energi / keV'); ylabel('log(Counts/s) / log(Bq)');

text(200, 3, '246 keV');
text(300, -2, '340 keV');
text(400, 2, '464 keV');
text(500, -2, '507 keV');
text(600, 2, '591 keV');
text(860, -2.5, '911 keV');
text(930, 1, '954 keV');
title('Th');
saveas(gcf, 'Spektrum', 'jpg');

shg;

%% Halvledare
newplot;
load('Halv');
x = (1:8192).*0.38412;
plot(x, log(Halv));
xlabel('Energi / keV'); ylabel('log(Counts) / log(Bq)');
saveas(gcf, 'Halvledare', 'jpg');
shg
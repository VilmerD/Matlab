load('H0');

h = H0(:,4);
L = length(h);
h1 = zeros(L,1);
for i = 1:L
    temp0 = strsplit(h(i),';');
    temp1 = temp0(2);
    h1(i) = replace(temp1, ',', '.');
end
h2 = max(h1, 0);

v1 = erase(H0(:,1), ';');
v2 = replace(v1, ',', '.');
v3 = str2double(v2(:,1));

x0 = [396.99 410.13 434.01 485.99 656.07];
y0 = [4500 7000 9500 24000 68000];
hold on
for k = 1:length(x0)
    htemp = x0(k);
    hamp = h2(v3 == htemp);
    
    text(htemp, y0(k), num2str(htemp));
    plot(htemp, hamp, 's');
end


plot(v3, h2);
xlabel("Wavelength /nm"); ylabel("Counts");
saveas(gcf, 'SpektraH', 'jpg');
shg
hold off
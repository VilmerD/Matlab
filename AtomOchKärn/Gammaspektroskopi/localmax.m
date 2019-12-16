function [x,y, ly] = localmax(v,lowb,topb, k)
%localmax Finds a minima in I
[y1,x1] = max(v(lowb/k:topb/k));
x = lowb + x1*k;
y = y1/300
ly = log(y);
end


function dudt = pendel(t, y) 
    dudt = [y(2); -sin(y(1))];
end
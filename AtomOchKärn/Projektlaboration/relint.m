function v = relint(bot, top, x, y)
t2i = find(x == bot): find(x == top);
ty = y(t2i);
v = sum(ty);
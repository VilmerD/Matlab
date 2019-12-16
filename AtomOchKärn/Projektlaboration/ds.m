function dsigma = ds(Da, Db, D1, D2, d)
dsigma = 1/(2*d)*(Da.^2 - Db.^2)/(D1^2-D2^2);
clc;
P = [3.53e+2 3.39e+2 2.77e+2 1.44e+6;...
-1.03e+2 2.33e+1 4.59e+2 -6.32e+5;...
7.07e-1 -3.53e-1 6.12e-1 -9.18e+2] 
% Any non-singular square matrix M can be
% decomposed into the product of an uppertriangular
% matrix K and an orthogonal matrix R
% using the RQ factorization
[K,R] = qr(P)
CameraCenter = R(:,4)

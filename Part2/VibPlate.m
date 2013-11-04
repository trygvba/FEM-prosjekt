addpath(genpath('../Part1'))
addpath(genpath('../Converter'))

%MATERIAL PARAMETERS: ALUMINUM
E = 390*10^9;
v = 0.25;
rho = 3.9*10^3;
C = (E/(1-v^2))*[1 v v 0 0 0;v 1 v 0 0 0;v v 1 0 0 0;0 0 0 (1-v)/2 0 0; 0 0 0 0 (1-v)/2 0;0 0 0 0 0 (1-v)/2];

[p tri tetr] = loadGeo('AluminumPlate');

A = Stiffness3D(tetr,p,C);

M = rho*MassMatrix3D(tetr,p);

%[V D]=eig(full(A),full(M));

%eigval = diag(D);

%save('../../vibplate.mat'); %lagrer lokalt 1 directory over mastermappa pga stor fil

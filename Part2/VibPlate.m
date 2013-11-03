addpath(genpath('../Part1'))

E = 390;
v = 0.25;

C = (E/(1-v^2))*[1 v v 0 0 0;v 1 v 0 0 0;v v 1 0 0 0;0 0 0 (1-v)/2 0 0; 0 0 0 0 (1-v)/2 0;0 0 0 0 0 (1-v)/2];

[p tri tetr] = loadGeo('AluminumPlate');

A = Stiffness3D(tetr,p,C);

M = MassMatrix3D(tetr,p);



clear all;
close all;

addpath(genpath('../Part1'))
addpath(genpath('../Converter'));

E = 390;
v = 0.25;
rho = 0.0039;
C = (E/(1-v^2))*[1 v v 0 0 0;v 1 v 0 0 0;v v 1 0 0 0;0 0 0 (1-v)/2 0 0; 0 0 0 0 (1-v)/2 0;0 0 0 0 0 (1-v)/2];

[p tri tetr] = loadGeo('Pawn');

A = Stiffness3D(tetr,p,C);

M = rho*MassMatrix3D(tetr,p);

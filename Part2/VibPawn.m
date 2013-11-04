clear all;
close all;

addpath(genpath('../Part1'))
addpath(genpath('../Converter'));

E = 390*10^9;
v = 0.25;
rho = 3.9*10^3;
C = (E/(1-v^2))*[1 v v 0 0 0;v 1 v 0 0 0;v v 1 0 0 0;0 0 0 (1-v)/2 0 0; 0 0 0 0 (1-v)/2 0;0 0 0 0 0 (1-v)/2];

[p tri tetr] = loadGeo('Pawn');

A = Stiffness3D(tetr,p,C);

M = rho*MassMatrix3D(tetr,p);

[V D] = eigs(A,M,20,'sm');
eigenvalues = diag(D);
%Pick the n'th eigenvalue we should analyse:
n = 15;
omega = eigenvalues(n);

u = V(:,n);

for i = 1:3:length(u)
	uvec(ceil(i/3),:) = [u(i) u(i+1) u(i+2)];
end


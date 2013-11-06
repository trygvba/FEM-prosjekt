clear all;
close all;

addpath(genpath('../Part1'))
addpath(genpath('../Converter'));

%----- PREPROCESSING:--------------
E = 390;
v = 0.25;
rho = 3.9*10^3;
B1 = E/(2*v^2+v-1)*[(v-1) -v -v; -v (v-1) -v; -v -v (v-1)];
B2 = E/(1-v^2)*[(1-v)/2 0 0; 0 (1-v)/2 0; 0 0 (1-v)/2];
C = [B1 zeros(3); zeros(3) B2];

[p tri tetr] = loadGeo('Pawn');

[A M] = MassAndStiffnessMatrix3D(tetr,p,C);
M = rho*M;

%Finding Homogenous:
dir = [];
for i=1:length(p)
    z = p(i,3);
    if z==0
        dir = [dir; 3*i; 3*i+1; 3*i+2];
    end
end

[A M] = homogenousBoundaryPawn(A,M,dir);
%-------SOLVING:----------------------
[V D] = eigs(A,M,20,'sm');
eigenvalues = diag(D);


%------POSTPROCESSING:------------------
%Pick the n'th eigenvalue we should analyse:
n = 15;
omega = eigenvalues(n);

u = V(:,n);
u = addingHomogenous2D(u,dir);
for i = 1:3:length(u)
	uvec(ceil(i/3),:) = [u(i) u(i+1) u(i+2)];
end

alpha = 5;
m = 3;	%Number of periods
counter = 1;
for t=linspace(0,m*2*pi,100)
	x = p+alpha*sin(t)*uvec;
	writeVTK(['../Animations/HmGPawn/HmGPawnTest'   '/timestep_' num2str(counter)],tetr,x,ones(length(p),1));
	counter = counter +1;
end

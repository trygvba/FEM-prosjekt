clear all
close all

%--------------Adding new path:---------------------
addpath([pwd '/Grids']);

%----------PREPRROCESSING:------------------------
f = @(x) -12*pi*cos(2*pi*sum(x.^2))+16*pi^2*sum(x.^2)*sin(2*pi*sum(x.^2));

%Generating grid:
N = 100;
[p tet edge] = getSphere(N);

%Assembly of stiffness matrix and loading vector:
[Ah fh] = stiffnessMatrix3D(tet,p,f);

%Removing edge nodes from our system:
boundary = unique(edge);
[Ah fh] = homogenousBoundary(Ah,fh,boundary);

%----------SOLVING:--------------------------
uh = Ah\fh;

u = addingHomogenous2D(uh,boundary);

%-------POSTPROCESSING:-----------------------
F = TriScatteredInterp(p,u);
isosurface(p(:,1),p(:,2),p(:,3),F(p));


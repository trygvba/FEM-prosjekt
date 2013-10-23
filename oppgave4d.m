clear all
close all

%--------------Adding new path:---------------------
addpath([pwd '/Grids']);

%----------PREPRROCESSING:------------------------
f = @(x) -12*pi*cos(2*pi*sum(x.^2))+16*pi^2*sum(x.^2)*sin(2*pi*sum(x.^2));
g = @(x) 4*pi*sqrt(sum(x.^2))*cos(2*pi*sum(x.^2));

%Generating grid:
N = 10000;
[p tet edge] = getSphere(N);

%Assembly of stiffness matrix and loading vector:
[Ah fh] = stiffnessMatrix3D(tet,p,f);

%Parsing boundary:
[dir neu] = parsingBoundary3D(p,edge);

%Additional loading contribution due to Neumann condition
fh = contributionNeumann3D(p,neu,fh,g);

%Removing equations corresponding to homogenous nodes.
[Ah fh] = homogenousBoundary(Ah,fh,dir);

%----------SOLVING:--------------------------
uh = Ah\fh;

u = addingHomogenous2D(uh,dir);

%---------POSTPROCESSING:---------------------
writeVTK([pwd '/Paraview/oppgave4d'],tet,p,u)
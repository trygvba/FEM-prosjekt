clear all
close all

%--------------Adding new path:---------------------
addpath([pwd '/Grids']);



%--------------PREPROCESSING:-----------------------
f = @(x) -8*pi*cos(2*pi*sum(x.^2))+16*pi^2*sum(x.^2)*sin(2*pi*sum(x.^2));

%Generating grid:
N = 1000;    %Number of nodes
[p tri edge] = getDisk(N);

%Assembly of stiffness matrix:
A = stiffnessMatrix2D(tri,p);

%Assembly of loading vector:
f = loadingvector2D(tri,p,f);

%Removing edge nodes from our system:
[Ah fh] = homogenousBoundary(A,f,edge(:,1));

%-------------------SOLVING:------------------

%Solving linear system:
uh = Ah\fh;

%Adding homogenouse boundary conditions to the u vector:
u = addingHomogenous2D(uh,edge(:,1));


%----------------POSTPROCESSING:-----------------
trimesh(tri,p(:,1),p(:,2),u)

filenm = [pwd '/Plots/2h' num2str(N) '.png'];
print('-dpng',filenm)
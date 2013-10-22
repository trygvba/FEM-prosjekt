clear all
close all

%--------------Adding new path:---------------------
addpath([pwd '/Grids']);



%--------------PREPROCESSING:-----------------------
f = @(x) -8*pi*cos(2*pi*sum(x.^2))+16*pi^2*sum(x.^2)*sin(2*pi*sum(x.^2));
g = @(x) 4*pi*sqrt(sum(x.^2))*cos(2*pi*sum(x.^2));

%Generating grid:
N = 5000;    %Number of nodes
[p tri edge] = getDisk(N);

%Assembly of stiffness matrix:
A = stiffnessMatrix2D(tri,p);

%Assembly of loading vector (Contribution from loading):
f = loadingvector2D(tri,p,f);

%Parsing boundary:
[dir neu] = parsingBoundary2D(p,edge);

%Assembly of loading vector (Contribution from Neumann boundary condition):
f = contributionNeumann2D(f,neu,p,g);

%Removing edge nodes from our system:
[Ah fh] = homogenousBoundary(A,f,dir);

%-------------------SOLVING:------------------

%Solving linear system:
uh = Ah\fh;

%Adding homogenouse boundary conditions to the u vector:
u = addingHomogenous2D(uh,dir);


%----------------POSTPROCESSING:-----------------
trimesh(tri,p(:,1),p(:,2),u)
xlabel('x-axis');
ylabel('y-axis');

filenm = [pwd '/Plots/3d' num2str(N) '.png'];
print('-dpng',filenm)
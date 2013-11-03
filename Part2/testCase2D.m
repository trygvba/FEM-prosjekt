clear all
close all

%--------------Adding new path:---------------------
addpath([fileparts(pwd) '/Grids']);
addpath([fileparts(pwd) '/Part1']);


%--------------PREPROCESSING:-----------------------
E = 100;      %Young's modulus;
v = 0.25;    %Poisson's Ration;
C = E/(1-v^2)*[1 v 0; v 1 0; 0 0 (1-v)/2];
f = @(x) E/(1-v^2)*[-2*x(2)^2-x(1)^2+v*x(1)^2-2*(1+v)*x(1)*x(2)+3-v; -2*x(1)^2-x(2)^2+v*x(2)^2-2*(1+v)*x(1)*x(2)+3-v];

%Generating grid:
N = 20;    %Number of nodes
[p tri edge] = getPlate(N);

%Assembly of stiffness matrix:
A = ElasticStiffness2D(tri,p,C);

%Assembly of loading vector:
f = LoadingVectorElasticity2D(tri,p,f);

dir = node2index2D(edge);
%Removing edge nodes from our system:
[Ah fh] = homogenousBoundary(A,f,dir);

%-------------------SOLVING:------------------

%Solving linear system:
uh = Ah\fh;

%Adding homogenouse boundary conditions to the u vector:
u = addingHomogenous2D(uh,dir);
u_vec=zeros(size(p,1),2);
for i=1:2:length(u);
    u_vec(ceil(i/2),:) = [u(i) u(i+1)];
end
displacement = p+u_vec;

%----------------POSTPROCESSING:-----------------

%Exact solution:
 u_exact = @(x) [(x(1)^2-1)*(x(2)^2-1) (x(1)^2-1)*(x(2)^2-1)];
 for i=1:length(p)
     displacement_exact(i,:) = u_exact(p(i,:));
 end
 exact = p+displacement_exact;
%-----------------------------------

triplot(tri,displacement(:,1),displacement(:,2),'b');
hold on
triplot(tri,exact(:,1),exact(:,2),'r');


filenm = [fileparts(pwd) '/Plots/Part2oppg2d' num2str(N) '.png'];
print('-dpng',filenm)
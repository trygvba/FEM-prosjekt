% An attempt at implementing a finite element method to the Helmholtz problem
% with equidistant nodes (and homogenous boundary conditions).
close all
clear all
%	HELMHOLTZ PROBLEM:
% -u_xx + \sigma*u = f in \Omega
%---------------------------------------------------------



%-----------PRELIMINARIES:-------------------------------
f = @(x) x^2*sin(pi*x);	% Describe your loading function
sigma = 0.5;
N = 100;	%Number of elements
x = linspace(0,1,N+2);
h = x(2)-x(1);

Mk = [ 2 1; 1 2];	%Elementwise contribution to the mass matrix 
Ak = [ 1 -1; -1 1];	%Elementwise contribution to the [insert name here] matrix.



%--------------ASSEMBLY--------------------------------
A = zeros(N+2);
M = zeros(N+2);
F = zeros(N+2,1);
for k = 1:N+1 %iterate over elements
  for alpha = 1:2
    i = k+alpha-1;
    F(i) = h*f(x(i));	%Blæh!
    for beta = 1:2
      j = k+beta-1;
        A(i,j) = A(i,j)+1/h*Ak(alpha,beta);
        M(i,j) = M(i,j)+h/6*Mk(alpha,beta);
    end		
  end
end

%-----------FINISHING UP---------------------------
A = A(2:(end-1),2:(end-1));
M = M(2:(end-1),2:(end-1));
F = F(2:(end-1));

u = (A+sigma*M)\F;
u = [0; u; 0];

figure
plot(x,u)


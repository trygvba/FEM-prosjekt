function M = MassMatrix3D(tet,p)
%Calculates the 3-dimensional mass matrix.
%tet is should be a Nx4-matrix where N is number of elements. Each row
%corresponds to the node indices making up one tetrahedron.
% p should be a dimx3-matrix where row i gives the x-, y- and z-coordinate
% of node i.
dim = size(p,1); 
N = size(tet,1);
I = eye(4);

Mp = 1/120*[2 1 1 1; 1 2 1 1; 1 1 2 1; 1 1 1 2];

M = zeros(3*dim);
for k=1:N
    p1 = p(tet(k,1),:)';
    p2 = p(tet(k,2),:)';
    p3 = p(tet(k,3),:)';
    p4 = p(tet(k,4),:)';
    P = [(p2-p1) (p3-p1) (p4-p1)];
    T = det(P);
    for alpha = 1:4
        ihat = tet(k,alpha);
        for beta = 1:4
            jhat = tet(k,beta);
            MassContribution = T*Mp(alpha,beta);
            for d=1:3
                i = 3*ihat+d-3;
                j = 3*jhat+d-3;
                M(i,j) = M(i,j) + MassContribution;
            end
        end
    end
end
M = sparse(M);      
end


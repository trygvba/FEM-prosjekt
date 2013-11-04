function A = Stiffness3D(tet,p,C)

%---------KEY MAGNITUDES:----------------
dim = size(p,1);
N = size(tet,1);
%--------ASSEMBLY:------------------------
A=zeros(3*dim);
I=eye(4);
for k=1:N
    p1 = p(tet(k,1),:)';
    p2 = p(tet(k,2),:)';
    p3 = p(tet(k,3),:)';
    p4 = p(tet(k,4),:)';
    X = [(p2-p1) (p3-p1) (p4-p1)];
    T = det(X)/6;
    Coeff = [1 p1'; 1 p2'; 1 p3'; 1 p4'];
    for alpha=1:4
        ihat = tet(k,alpha);
        c_alpha = Coeff\I(:,alpha);
        i1 = 3*ihat-2;
        i2 = 3*ihat-1;
        i3 = 3*ihat;
        for beta=1:4
            jhat = tet(k,beta);
            c_beta=Coeff\I(:,beta);
            j1 = 3*jhat-2;
            j2 = 3*jhat-1;
            j3 = 3*jhat;
            a1=[c_alpha(2) 0 0 c_alpha(3) c_alpha(4) 0];
            b1=[c_beta(2); 0;0; c_beta(3); c_beta(4); 0];
            a2=[0 c_alpha(3) 0 c_alpha(2) 0 c_alpha(4)];
            b2=[0;c_beta(3);0;c_beta(2);0;c_beta(4)];
            a3=[0 0 c_alpha(4) 0 c_alpha(2) c_alpha(3)];
            b3=[0;0;c_beta(4);0;c_beta(2);c_beta(3)];
            A(i1,j1) = A(i1,j1)+T*a1*C*b1;
            A(i1,j2) = A(i1,j2)+T*a1*C*b2;
            A(i1,j3) = A(i1,j3)+T*a1*C*b3;
            A(i2,j1) = A(i2,j1)+T*a2*C*b1;
            A(i2,j2) = A(i2,j2)+T*a2*C*b2;
            A(i2,j3) = A(i2,j3)+T*a2*C*b3;
            A(i3,j1) = A(i1,j2)+T*a3*C*b1;
            A(i3,j2) = A(i1,j3)+T*a3*C*b2;
            A(i3,j3) = A(i1,j2)+T*a3*C*b3;
        
        end
    end
end
A = sparse(A);
end

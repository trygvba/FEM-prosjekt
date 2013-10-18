function A = stiffnessMatrix2D(tri,p)

%----------PROTOTYPE MATRIX:--------------
Ap = 0.5*[2 -1 -1; -1 1 0; -1 0 1];


%---------KEY MAGNITUDES:----------------
dim = size(p,1);
N = size(tri,1);
%--------ASSEMBLY:------------------------
A=zeros(dim);
for k=1:N
    p1 = p(tri(k,1),:)';
    p2 = p(tri(k,2),:)';
    p3 = p(tri(k,3),:)';
    X = [(p2-p1) (p3-p1)];
    T = det(X);
    for alpha=1:3
        i = tri(k,alpha);
        for beta=1:3
            j = tri(k,beta);
            A(i,j)=A(i,j)+T*Ap(alpha,beta);
        end
    end
end
end


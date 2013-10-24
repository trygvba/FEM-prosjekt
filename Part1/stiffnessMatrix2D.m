function A = stiffnessMatrix2D(tri,p)

%---------KEY MAGNITUDES:----------------
dim = size(p,1);
N = size(tri,1);
%--------ASSEMBLY:------------------------
A=zeros(dim);
I=eye(3);
for k=1:N
    p1 = p(tri(k,1),:)';
    p2 = p(tri(k,2),:)';
    p3 = p(tri(k,3),:)';
    X = [(p2-p1) (p3-p1)];
    T = det(X);
    C = [1 p1'; 1 p2'; 1 p3'];
    for alpha=1:3
        i = tri(k,alpha);
        c_alpha = C\I(:,alpha);
        for beta=1:3
            j = tri(k,beta);
            c_beta=C\I(:,beta);
            A(i,j)=A(i,j)+0.5*T*(c_beta(2:3)'*c_alpha(2:3));
        end
    end
end
A = sparse(A);
end


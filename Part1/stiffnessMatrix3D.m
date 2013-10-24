function [Ah fh] = stiffnessMatrix3D(tet,p,f)
N = size(tet,1);
dim=size(p,1);
I = eye(4);
Ah = zeros(dim);
fh = zeros(dim,1);
for k=1:N
    p1 = p(tet(k,1),:)';
    p2 = p(tet(k,2),:)';
    p3 = p(tet(k,3),:)';
    p4 = p(tet(k,4),:)';
    X = [(p2-p1) (p3-p1) (p4-p1)];
    T = det(X)/6;
    C = [1 p1'; 1 p2'; 1 p3'; 1 p4'];
    for alpha=1:4
        i = tet(k,alpha);
        c_alpha = C\I(:,alpha);
        y = @(x) c_alpha'*[1; x]*f(x);
        fh(i) = fh(i) + quadrature3D(p1,p2,p3,p4,1,y);
        for beta=1:4
            j = tet(k,beta);
            c_beta = C\I(:,beta);
            Ah(i,j) = Ah(i,j) + T*c_alpha(2:end)'*c_beta(2:end);
        end
    end
end
Ah = sparse(Ah);
end


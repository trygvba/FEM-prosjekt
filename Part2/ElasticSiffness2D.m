function A = ElasticSiffness2D(tri,p,C)

%---------KEY MAGNITUDES:----------------
dim = size(p,1);
N = size(tri,1);
%--------ASSEMBLY:------------------------
A=zeros(2*dim);
I=eye(3);
for k=1:N
    p1 = p(tri(k,1),:)';
    p2 = p(tri(k,2),:)';
    p3 = p(tri(k,3),:)';
    X = [(p2-p1) (p3-p1)];
    T = 0.5*det(X);
    
    Coeff = [1 p1'; 1 p2'; 1 p3'];
    for alpha=1:3
        ihat = tri(k,alpha);
        c_alpha = Coeff\I(:,alpha);
        i1 = 2*ihat-1;
        i2 = 2*ihat;
        for beta=1:3
            jhat = tri(k,beta);
            c_beta=Coeff\I(:,beta);
            j1 = 2*jhat-1;
            j2 = 2*jhat;
            A(i1,j1) = A(i1,j1)+T*[c_alpha(2) 0 c_alpha(3)]*C*[c_beta(2); 0; c_beta(3)];
            A(i1,j2) = A(i1,j2)+T*[c_alpha(2) 0 c_alpha(3)]*C*[0; c_beta(3); c_beta(2)];
            A(i2,j1) = A(i2,j1)+T*[0 c_alpha(3) c_alpha(2)]*C*[c_beta(2); 0 ; c_beta(3)];
            A(i2,j2) = A(i2,j2)+T*[0 c_alpha(3) c_alpha(2)]*C*[0; c_beta(3); c_beta(2)];
            
        end
    end
end
A = sparse(A);
end
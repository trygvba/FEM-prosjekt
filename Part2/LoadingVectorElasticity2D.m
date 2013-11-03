function fh = LoadingVectorElasticity2D(tri,p,f)

dim = size(p,1);
N = size(tri,1);
fh = zeros(2*dim,1);
I = eye(3);

for k=1:N
    p1 = p(tri(k,1),:)';
    p2 = p(tri(k,2),:)';
    p3 = p(tri(k,3),:)';
    C = [1 p1'; 1 p2'; 1 p3'];
    for alpha = 1:3
        ihat = tri(k,alpha);
        i1 = 2*ihat-1;
        i2 = 2*ihat;
        c_alpha = C\I(:,alpha);
        f1 = @(x) [c_alpha'*[1; x] 0]*f(x);
        f2 = @(x) [0 c_alpha'*[1; x]]*f(x);
        fh(i1) = fh(i1)+quadrature2D(p1,p2,p3,4,f1);
        fh(i2) = fh(i2)+quadrature2D(p1,p2,p3,4,f2);
    end
end
    

end


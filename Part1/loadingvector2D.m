function f = loadingvector2D(tri,p,g)
N = size(tri,1);
dim = size(p,1);

f = zeros(dim,1);
for k=1:N
    p1 = p(tri(k,1),:)';
    p2 = p(tri(k,2),:)';
    p3 = p(tri(k,3),:)';
    
    fp = loadingApproximator2D(p1,p2,p3,g);
    for alpha = 1:3
        i=tri(k,alpha);
        f(i) = f(i)+fp(alpha);
    end
end

end


function fn = contributionNeumann3D(p,neu,fh,g)
N = size(neu,1);
fn = fh;
I = eye(3);

for k=1:N
    index = neu(k,:);
    p1 = p(index(1),:)';
    p2 = p(index(2),:)';
    p3 = p(index(3),:)';
    P = [p1'; p2'; p3'];
    for alpha=1:3
        c = P\I(:,alpha);
        y = @(x) (c'*x)*g(x);
        fn(index(alpha)) = fn(index(alpha))+planeIntegral3D(p1,p2,p3,4,y);
    end
end    
end


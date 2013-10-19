function fn = contributionNeumann2D(f,neu,p,g)
N = size(neu,1);
fn = f;
for i=1:N
    index1 = neu(i,1);
    index2 = neu(i,2);
    p1 = p(index1,:)';
    p2 = p(index2,:)';
    
    P = [p1'; p2'];
    c1 = P\[1;0];
    c2 = P\[0;1];
    y1 = @(x) (c1'*x)*g(x);
    y2 = @(x) (c2'*x)*g(x);
    fn(index1) = fn(index1)+lineIntegral2D(p1,p2,4,y1);
    fn(index2) = fn(index2)+lineIntegral2D(p1,p2,4,y2);
end
end


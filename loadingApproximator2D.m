function I = loadingApproximator2D(p1, p2, p3,g)
B = [(p2-p1) (p3-p1)];
T = 0.5*det(B);

eta= 0.5*[1 1 0; 1 0 1; 0 1 1];
weights = 1/3*[1 1 1];

I = zeros(3,1);
for i=1:3
    I = I + T*weights(i)*g([p1 p2 p3]*eta(i,:)').*eta(i,:)';
end
end


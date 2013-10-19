teller= zeros(100,1);
for i = 1:100
    teller(i) = sum(sum(tri==i));
end
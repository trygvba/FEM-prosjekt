function dir = node2index2D(edge)

N = length(edge);
dir = zeros(2*N,1);
for i=1:N
    dir(2*i-1) = 2*edge(i)-1;
    dir(2*i)=2*edge(i);
end

end


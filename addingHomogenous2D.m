function u = addingHomogenous2D(uh,edge)
N = length(edge);
u = uh;

for i=1:N
    index = edge(i);
    if index >= length(u)
        u = [u; 0];
    elseif index < length(u)
        u = [u(1:(index-1)); 0 ; u(index:end)];
    end
end


end


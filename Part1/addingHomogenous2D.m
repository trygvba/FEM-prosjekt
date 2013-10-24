function u = addingHomogenous2D(uh,edge)
bound = sort(edge);
N = length(bound);
u = uh;

for i=1:N
    index = bound(i);
    if index > length(u)
        u = [u; 0];
    elseif index < length(u)
        u = [u(1:(index-1)); 0 ; u(index:end)];
    elseif index==length(u)
        u = [u(1:(end-1)); 0; u(end)];
    end
end


end


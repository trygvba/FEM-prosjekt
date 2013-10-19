function [Dirichlet Neumann] = parsingBoundary2D(p,edge)
Dirichlet = [];
Neumann = [];

N = size(edge,1);
for i=1:N
    index = edge(i,1);
    y = p(index,2);
    if y>0
        Neumann = [Neumann; edge(i,:)];
    else
        Dirichlet = [Dirichlet; edge(i,1)];
    end
end
end


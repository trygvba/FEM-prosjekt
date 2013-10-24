function [Dirichlet Neumann] = parsingBoundary2D(p,edge)
Dirichlet = [];
Neumann = [];

N = size(edge,1);
for i=1:N
    index1 = edge(i,1);
    index2 = edge(i,2);
    y1 = p(index1,2);
    y2 = p(index2,2);
    if (y1>0)||(y2>0)
        Neumann = [Neumann; edge(i,:)];
    end
    if y1<=0
        Dirichlet = [Dirichlet; edge(i,1)];
    end
end
end


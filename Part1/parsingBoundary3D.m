function [dir neu] = parsingBoundary3D(p,edge)
dir = [];
neu = [];
bound= unique(edge);

for i=1:size(edge,1)
    z1 = p(edge(i,1),3);
    z2 = p(edge(i,2),3);
    z3 = p(edge(i,3),3);
    
    if (z1>0)||(z2>0)||(z3>0)
        neu = [neu; edge(i,:)];
    end
end
for j = 1:length(bound)
    z = p(bound(j),3);
    if z<=0
        dir = [dir; bound(j)];
    end
end
end


function [Ah fh] = homogenousBoundary(A,f,edge)
Ah = A;
fh = f;
N = length(edge);
bound = sort(edge);
for i = N:-1:1
    index = bound(i);
    
    if index==1
        Ah = Ah(2:end,2:end);
        fh = fh(2:end);
    elseif index==length(f);
        Ah=Ah(1:(end-1),1:(end-1));
        fh = fh(1:(end-1));
    else
        Ah = Ah([1:(index-1) (index+1):end],[1:(index-1) (index+1):end]);
        fh = fh([1:(index-1) (index+1):end]);
    end
end
end
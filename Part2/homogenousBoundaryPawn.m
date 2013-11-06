function [Ah Mh] = homogenousBoundary(A,M,edge)
Ah = A;
Mh = M;
N = length(edge);
bound = sort(edge);
for i = N:-1:1
    index = bound(i);
    
    if index==1
        Ah = Ah(2:end,2:end);
        Mh = Mh(2:end,2:end);
    elseif index==size(A,1);
        Ah=Ah(1:(end-1),1:(end-1));
        Mh=Mh(1:(end-1),1:(end-1));
    else
        Ah = Ah([1:(index-1) (index+1):end],[1:(index-1) (index+1):end]);
        Mh = Mh([1:(index-1) (index+1):end],[1:(index-1) (index+1):end]);
    end
end
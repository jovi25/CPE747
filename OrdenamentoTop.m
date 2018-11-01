function Qord = OrdenamentoTop(Q)

Qp = Largura(Q);

[~,index] = sort(Qp(:,3),'descend');

for k=1:numel(Q)
    
%     Qsort{k} = Q{index(k)};
    Qord(k,1) = index(k);
    Qord(k,2) = Qp(index(k),(2));
    Qord(k,3) = Qp(index(k),(3));
    
end

end
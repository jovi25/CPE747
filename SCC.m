function QFC = SCC(Q)

Qp = Largura(Q);

%%----------------------- Invertendo as transições ----------------------%%

for k=1:numel(Q)
    
    for i=1:numel(Q{k})
        
        Qalt{Q{k}{i}(1)}{k} = [k Q{k}{i}(2)];
        
    end

end


for k=1:numel(Qalt)
    if(numel(Qalt{k})>1)
        Qalt{k} = Qalt{k}(~cellfun('isempty',Qalt{k}));
    end
end


%%------------------------- Transições Invertidas -----------------------%%

[~,index] = sort(Qp(:,3),'descend');

% Inicialização
for k=1:numel(Q)
    % 0 = branco ; 1 = cinza ; 2 = preto
    
    Qp2(k,:) = [0 inf 0];
    
%     Qp(1) = %u.color
%     Qp(2) = %u.d (distância)
%     Qp(3) = %u.pi (descobrimento)

end

time = 0;
i=1;
for u=1:numel(Q)
    if(Qp2(index(u),1)==0)
        [Qalt,Qp2] = DFS_Visit2(Qalt,Qp2,index(u),time,i);
        Qp2(index(u),5)=i;
        i=i+1;
    end
end

% QFC = Qp2;
 
for k=1:numel(Q)
    
    QFC(k,1) = k;
    QFC(k,2) = Qp2(k,2);
    QFC(k,3) = Qp2(k,4);
    QFC(k,4) = Qp2(k,5);
    
end

end
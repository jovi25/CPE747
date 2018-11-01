function Qcoac = CoAcessivel(Q,Qm)

% Inicialização
for k=1:numel(Q)
    % 0 = branco ; 1 = cinza ; 2 = preto
    
    Qp(k,:) = [0 inf 0];
    
%     Qp(1) = %u.color
%     Qp(2) = %u.d (distância)
%     Qp(3) = %u.pi (descobrimento)

end


% Buscando o Estado Inicial
m = 0;
for k=1:length(Qm)
    
    if(Qm(k)==1)
        m = m+1;
        Ini(m) = k;
    end
    
end



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

time = 0;

for u=1:length(Ini)
    if(Qp(Ini(u),1)==0)
        [Qalt,Qp,time] = DFS_Visit(Qalt,Qp,Ini(u),time);
    end
end

for k=1:numel(Q)
    
%     Qsort{k} = Q{index(k)};
    Qcoac(k,1) = k;
    Qcoac(k,2) = Qp(k,2);
    Qcoac(k,3) = Qp(k,4);
    
end

end
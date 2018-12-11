function [EstCoAc,Qout] = AutomatoCoAcessivel(Q,Qm)

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

% Agrupando somente os estados coacessíveis
i=0;
for k=1:length(Qcoac(:,3))
    if(Qcoac(k,3)~=0)
        i=i+1;
        EstCoAc(i) = Qcoac(k,1);
    end
end


% Pegando o autômato CoAcessível
for k=1:length(Qcoac)
    if(Qcoac(k,3)~=0)
        Qout{k}=Q{k};
    end
end
    

% Removendo as transições do CoAcessível
for k=1:numel(Qout)
    for i=1:numel(Qout{k})
        if(Qcoac(Qout{k}{i}(1),3)==0)
            Qout{k}{i} = [];
        end
    end
    if (~isempty(Qout{k}))
        Qout{k} = Qout{k}(~cellfun('isempty',Qout{k}));
    end
end

end
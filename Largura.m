function Qlar = Largura(Q)

% Inicialização
for k=1:numel(Q)
    % 0 = branco ; 1 = cinza ; 2 = preto
    
    Qp(k,:) = [0 inf 0];
    
%     Qp(1) = %u.color
%     Qp(2) = %u.d (distância)
%     Qp(3) = %u.pi (descobrimento)

end

time = 0;

for u=1:numel(Q)
    if(Qp(u,1)==0)
        [Q,Qp,time] = DFS_Visit(Q,Qp,u,time);
    end
end

for k=1:numel(Q)
    
%     Qsort{k} = Q{index(k)};
    Qlar(k,1) = k;
    Qlar(k,2) = Qp(k,2);
    Qlar(k,3) = Qp(k,4);
    
end

end
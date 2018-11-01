function Qp = Largura(Q)

%---------- Legenda de Eventos: a=1, b=2, c=3, ... ----------%

% Estrutura: {[Destino Evento]}
Q{1} = {[2 1]};
Q{2} = {[3 1]};
Q{3} = {[2 2]};
Q{4} = {[2 1] [5 2]};
Q{5} = {[3 2] [6 3]};
Q{6} = {[4 1]};

%---------- Legenda de Eventos: a=1, b=2, c=3, ... ----------%

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

end
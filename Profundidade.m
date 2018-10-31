function Qreach = Profundidade(Q,Qi)

%---------- Legenda de Eventos: a=1, b=2, c=3, ... ----------%

% Inicialização
for k=1:length(Qi)
    % 0 = branco ; 1 = cinza ; 2 = preto
    
    Qp(k,:) = [0 inf 0];
    
%     Qp(1) = 0; %u.color
%     Qp(2) = inf; %u.d (distância)
%     Qp(3) = 0; %u.pi (descobrimento)

end

% Buscando o Estado Inicial
for k=1:length(Qi)
    
    if(Qi(k)==1)
        Ini = k;
    end
    
end

% Iniciando o método com ele como source
Qp(Ini,:) = [1 0 0];

Queue(1)=Ini;

i=1; k=1; reach = 1;
while(Queue*Queue'~=0)
    u = Queue(k);
    Queue(k) = 0;
    for j=1:numel(Q{u})
        aux = Q{u}{j}(1);
        if(Qp(aux,1)==0)
            i = i+1;
            Queue(i) = aux;
            Qp(i,:) = [1 0 0];
        end
    end
    Qp(u,1) = 2;
    Qreach(reach) = u;
    reach = reach+1;
    k = k+1;
end

end
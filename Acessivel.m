function Qac = Acessivel(Q,Qi)

%---------- Legenda de Eventos: a=1, b=2, c=3, ... ----------%

% Inicialização
for k=1:length(Qi)
    % 0 = branco ; 1 = cinza ; 2 = preto
    
    Qp(k,:) = [0 inf 0];
    
%     Qp(1) = %u.color
%     Qp(2) = %u.d (distância)
%     Qp(3) = %u.pi (descobrimento)

end

% Buscando o Estado Inicial
m = 0;
for k=1:length(Qi)
    
    if(Qi(k)==1)
        m = m+1;
        Ini(m) = k;
    end
    
end


for n=1:length(Ini)

% Iniciando o método com ele como source
    Qp(Ini(n),:) = [1 0 0];

    Queue(1)=Ini(n);

    i=1; k=1; reach = 1;
    while(Queue*Queue'~=0)
        u = Queue(k);
        Queue(k) = 0;
        for j=1:numel(Q{u})
            aux = Q{u}{j}(1);
            if(Qp(aux,1)==0)
                i = i+1;
                Queue(i) = aux;
                Qp(aux,:) = [1 0 0];
            end
        end
        Qp(u,1) = 2;
        Qac(n,reach) = u;
        reach = reach+1;
        k = k+1;
    end

end

end
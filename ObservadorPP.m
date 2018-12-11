function [Rf] = ObservadorPP(Q,Qi,E,Eqo)

% Determinando as transições observáveis
j=0;
for i=1:length(E)
    if(~ismember(E(i),Eqo))
        j=j+1;
        Equo(j) = E(i);
    end
end

% Criando legenda
for k=1:numel(Q)
    p=1;
    for j=2:numel(Q{k})        
        if(ismember(Q{k}{j}{2},Equo))
            p=p+1;
            Laux{k}{p}=Q{k}{j}{1};
        end
    end
    Laux{k}{1}=Q{k}{1};
end

% Organizando o Laux na ordem
for k=1:numel(Q)
    for l=1:numel(Laux)
        if(Laux{l}{1}(1)==k)
            L{k}=Laux{l};
        end
    end
end

Qaux = Q;

% Realizar mesma organização para o Q !!!
for k=1:numel(Q)
    for l=1:numel(Qaux)
        if(Qaux{l}{1}(1)==k)
            Q{k}=Qaux{l};
        end
    end
end

qnext{1} = L{(Qi == 1)};

% Gerando o resultado
k=0; iq=1;
while 1
    k=k+1; ir=1;
    if(k>numel(qnext))
        break
    end
    
    for l=1:length(qnext{k})
        for m=2:numel(Q{qnext{k}{l}(1)})
            if(~ismember(Q{qnext{k}{l}(1)}{m}{2},Equo))
                ir=ir+1;
                R{k}{ir} = {L{Q{qnext{k}{l}(1)}{m}{1}} Q{qnext{k}{l}(1)}{m}{2}};
            end
        end

    end
    
    Rf{k}{1}=qnext{k};
    
    
    % Arrumando os estados e transições "repetidos"
    
    for itent=1:length(Eqo)
        auxcat = []; iitent = 1; iiaux=0;
        while iitent<numel(R{k})
            iitent=iitent+1;
            if(R{k}{iitent}{end}==Eqo(itent))
                iiaux=iiaux+1;
                if(iiaux>1)
                    Rf{k}{ia}{1} = [Rf{k}{ia}{1} R{k}{iitent}{1}];
                else
                    Rf{k}{iitent}{1} = R{k}{iitent}{1};
                    Rf{k}{iitent}{2} = R{k}{iitent}{end};
                    ia = iitent;
                end
            end
        end
        
    end
    
    % Final da tentativa
    
    
    for i=2:numel(Rf{k})
        add=1; addaux=0;
        for j=1:numel(qnext)
            
            if(isempty(Rf{k}{i}))
                add=0;
            elseif(length(qnext{j})==length(Rf{k}{i}{1}))
                if(all(ismember(qnext{j}{1},Rf{k}{i}{1}{1})))
                    add=0;
                end
            end
            
        end
        
        if(add==1)
            iq=iq+1;
            qnext{iq}=Rf{k}{i}{1};
        end
        
    end
    
end

for i=1:numel(Rf)
        Rf{i}=Rf{i}(~cellfun('isempty',Rf{i}));
end

end
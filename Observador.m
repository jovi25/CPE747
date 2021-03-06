function [Rf,Rm] = Observador(Q,Qi,Qm,E,Eqo)

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
        if(ismember(Q{k}{j}(2),Equo))
            p=p+1;
            Laux{k}(p)=Q{k}{j}(1);
        end
    end
    Laux{k}(1)=k;
end

L=Laux;

% Arrumando Legenda
for k=1:numel(L)
    m=1;
    while(m < length(L{k}))
        m=m+1;
        if(length(L{k})>1)
            L{k}(end+1:end+length(Laux{L{k}(m)}))=Laux{L{k}(m)};
            L{k}=unique(L{k});
        end
    end
end

qnext{1} = L{(Qi == 1)};
if(Qm(qnext{1}==1))
    Rm(1)=1;
else
    Rm(1)=0;
end


% Gerando o resultado
k=0; iq=1;
while 1
    k=k+1; ir=1;
    if(k>numel(qnext))
        break
    end
    
    for l=1:length(qnext{k})
        for m=1:numel(Q{qnext{k}(l)})
            if(~ismember(Q{qnext{k}(l)}{m}(2),Equo))
                ir=ir+1;
                R{k}{ir} = {L{Q{qnext{k}(l)}{m}(1)} Q{qnext{k}(l)}{m}(2)};
            end
        end

    end
    
    Rf{k}{1}=qnext{k};
    
    marcado=0;
    for i=1:length(Rf{k}{1})
        if(Qm(Rf{k}{1}(i))==1)
            marcado=1;
            Rm(k)=1;
        end
    end
    if(marcado==0)
        Rm(k)=0;
    end
    
    
    % Tentativa de arrumar os estados e transições "repetidos"
    
    for itent=1:length(Eqo)
        auxcat = []; iitent = 1; iiaux=0;
        while iitent<numel(R{k})
            iitent=iitent+1;
            if(R{k}{iitent}{2}==Eqo(itent))
                iiaux=iiaux+1;
                if(iiaux>1)
                    Rf{k}{ia}{1} = [Rf{k}{ia}{1} R{k}{iitent}{1}];
                else
                    Rf{k}{iitent}{1} = R{k}{iitent}{1};
                    Rf{k}{iitent}{2} = R{k}{iitent}{2};
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
                if(all(ismember(qnext{j},Rf{k}{i}{1})))
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
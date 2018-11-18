function [R,Rm] = Observador(Q,Qi,Qm,Equo)

qnext{1} = find(Qi == 1);
if(Qm(qnext{1}==1))
    Rm(1)=1;
else
    Rm(1)=0;
end

% Criando legenda
for k=1:numel(Q)
    p=1;
    for j=1:numel(Q{k})
        if(ismember(Q{k}{j}(2),Equo))
            p=p+1;
            Laux{k}(p)=Q{k}{j}(1);
        end
    end
    Laux{k}(1)=k;
end

L=Laux;

% Arrumando Legenda
for k=1:numel(Laux)
    for m=1:length(Laux{k})
        if(length(Laux{k})>1)
            L{k}(end+1:end+length(Laux{Laux{k}(m)}))=Laux{Laux{k}(m)};
            L{k}=unique(L{k});
        end
    end
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
        
        a=0;
        while 1
            a=a+1;
            
            if(a>numel(R{k}))
                break
            end
            
            while(isempty(R{k}{a}))
                a=a+1;
                if(a>numel(R{k}))
                    break
                end
            end
            
            if(a>numel(R{k}))
                break
            end
            
            aux1 = R{k}{a}{2};
            
            b=0;
            while 1
                b=b+1;
                if(a==b)
                    b=b+1;
                end
                
                if(b>numel(R{k}))
                    break
                end
                
                while(isempty(R{k}{b}) || a==b)
                    b=b+1;
                    if(b>numel(R{k}))
                        break
                    end
                end
                
                if(b>numel(R{k}))
                    break
                end
                
                aux2 = R{k}{b}{2};
                
                if(aux1==aux2)
                    R{k}{a}{1} = unique([R{k}{a}{1},R{k}{b}{1}]);
                    R{k}{b} = [];
                end
            end
        end        
        
    end
    
    R{k}{1}=qnext{k};
    
    marcado=0;
    for i=1:length(R{k}{1})
        if(Qm(R{k}{1}(i))==1)
            marcado=1;
            Rm(k)=1;
        end
    end
    if(marcado==0)
        Rm(k)=0;
    end
        
    
    for i=2:numel(R{k})
        add=1; addaux=0;
        for j=1:numel(qnext)
            
            if(isempty(R{k}{i}))
                add=0;
            elseif(ge(length(qnext{j}),length(R{k}{i}{1})))
                if(ismember(R{k}{i}{1},qnext{j}))
                    add=0;
                end
            end
            
        end
        
        if(add==1)
            iq=iq+1;
            qnext{iq}=R{k}{i}{1};
        end
        
    end
    
end

for i=1:numel(R)
        R{i}=R{i}(~cellfun('isempty',R{i}));
end

end
function atraso = AtrasoParaDiagnostico(Q,Qm,Qi,Eq,Eqo,Equo,Eqf)

% Pegando o Verificador
Gv = Verificador(Q,Qm,Qi,Eq,Eqo,Equo,Eqf);

% Marcando os estados cuja última componente é rotulada por Y
for k=1:numel(Gv)
    if(Gv{k}{1}{2}(2)==2)
        Gvm(k) = 1;
    else
        Gvm(k) = 0;
    end
end

% Criando Gv barra
Gvbar = Gv;
for k=1:numel(Gvbar)
    if(Gvm(k)==0)
        aux(k,:) = [Gvbar{k}{1}{1} Gvbar{k}{1}{2}];
        Gvbar{k}=[];
    end
end

% Removendo as transições para os estados removidos de Gv
for k=1:numel(Gvbar)
    if(~isempty(Gvbar{k}))
        for i=2:numel(Gvbar{k})
            if(ismember([Gvbar{k}{i}{1}{1} Gvbar{k}{i}{1}{2}],aux))
                Gvbar{k}{i} = [];
            end
        end
    end
end

% Removendo os nulls de Gvbar
Gvbar = Gvbar(~cellfun('isempty',Gvbar));

% Criando Gdag (SCC de Gvbar)

    % Arrumando Gvbar para aplicar SCC
GvbarAux = Gvbar;
for k=1:numel(GvbarAux)
    aux(k,:) = [GvbarAux{k}{1}{1} GvbarAux{k}{1}{2}];
end

for k=1:numel(GvbarAux)
    Gvbar{k}=[];
    for i=2:numel(GvbarAux{k})
        [~,varaux]=ismember([GvbarAux{k}{i}{1}{1} GvbarAux{k}{i}{1}{2}],aux,'rows');
        Gvbar{k}{i-1} = [varaux GvbarAux{k}{i}{2}];
    end
end

GvbarSCC = SCC(Gvbar);

% Criando Gdag no formato de Gvbar
b=0;
for k=1:numel(Gvbar)
    
    if (k>1 && GvbarSCC(k,4)==GvbarSCC(k-1,4))
        a=i;
    else
        a=0;
        b=b+1;
    end
    
    if(~isempty(Gvbar{k}))
        for i=1:numel(Gvbar{k})
            Gdag{b}{a+i}=Gvbar{k}{i};
        end
    else
        Gdag{b}{1}=[];
    end
    
end

% Removendo as transições sigma R
for k=1:numel(Gdag)
    for i=1:numel(Gdag{k})
        a=1;
        if(~isempty(Gdag{k}{i}) && ismember(Gdag{k}{i}(2),Eq))
            GdagR{k}{a}=Gdag{k}{i};
            a=a+1;
        elseif(isempty(Gdag{k}{i}))
            GdagR{k}{1}=[];
        end
    end
end

% Organizando GdagR para jogar na função de Ordenamento Topológico
for k=1:numel(GdagR)
    if(~isempty(GdagR{k}{1}))
        GdagR{k}{1}(1) = k+1;
    else
% Self loop com transição inexistente para a Ordenamento Topológico
        GdagR{k}{1}=[k 0]; 
    end
end

% Jogando no Ordenamento Topológico
GdagOrd = OrdenamentoTop(GdagR);

[~,index] = sort(GdagOrd(:,3),'descend');

GdagOrdEstados = GdagOrd(index,1);

atraso=0; k=1;
while k < GdagOrdEstados(end)
    
    if(isempty(GdagR{k}))
        break
    end
    
    if(numel(GdagR{k})==1)
        atraso = atraso+1;
        k = GdagR{k}{1}(1);
    end
end

end
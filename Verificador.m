function Gv = Verificador(Q,Qm,Qi,Eq,Eqo,Equo,Eqf)

% Verificador

% An
EmenosEqf = union(Eqo,Equo);
for k=1:length(EmenosEqf)
    An{1}{k} = [1 EmenosEqf(k)];
end
Ani = 1; Anm = 0;

[Gn,~] = Produto(Q,Qm,Qi,An,Anm,Ani);


% Fazendo GnR
EGn = Eqo;
for k=1:numel(Gn)
    for i=2:numel(Gn{k})
        if(ismember(Gn{k}{i}{2},Equo))
            Gn{k}{i}{2} = Gn{k}{i}{2}*10;
            EGn = union(EGn,Gn{k}{i}{2});
        end
    end
end


% Organizando Gn para o procedimento
Gnauxiliar = Gn;
Gn = [];
for k=1:numel(Gnauxiliar)
    Gn{Gnauxiliar{k}{1}(1)} = Gnauxiliar{k};
end



% Al
for k=1:length(Eqf)
    Al{1}{k} = [2 Eqf(k)];
    Al{2}{k} = [2 Eqf(k)];
end
Ali = [1 0]; Alm = [0 0]; EAl = Eqf;

% Gl
[Gl,~] = Paralelo(Q,Qm,Qi,Eq,Al,Alm,Ali,EAl);
EGl = Eq; EGlo = Eqo; Gli = 1;

% Gl Marcado pós falha
Glm = zeros(1,numel(Gl));
for k=1:numel(Gl)
    
    for i=2:numel(Gl{k})
        
        if(Glm(Gl{k}{1}(1))==1)
            Glm(Gl{k}{i}{1}(1))=1;
        end
        if(ismember(Gl{k}{i}{2},Eqf))
            Glm(Gl{k}{i}{1}(1))=1;
        end
        
    end
    
end

% GF = CoAc (Gl marcado pós falha)

    % Organizando Gl para fazer o CoAcessível
Glauxiliar = Gl;
Gl = [];
for k=1:numel(Glauxiliar)
    Gl{Glauxiliar{k}{1}(1)} = Glauxiliar{k};
end

    % Tratamento das variáveis pra usar a função CoAc
Glaux = Gl;
Gl = [];
for k=1:numel(Glaux)  
    for i=2:numel(Glaux{k})  
        Gl{k}{i-1} = [Glaux{k}{i}{1}(1) Glaux{k}{i}{2}];
    end
end

    % Pegando de fato o CoAcessível
GlCoAc = CoAcessivel(Gl,Glm);
for k=1:length(GlCoAc)
    if(GlCoAc(k,3)~=0)
        GFaux{k}=Glaux{k};
        GF{k}=Gl{k};
    end
end
GFi = zeros(1,numel(GF)); GFi(1) = 1;
EGF = Eq;

    % Removendo as transições do CoAcessível em GF
for k=1:numel(GF)
    for i=1:numel(GF{k})
        if(GlCoAc(GF{k}{i}(1),3)==0)
            GF{k}{i} = [];
        end
    end
    if (~isempty(GF{k}))
        GF{k} = GF{k}(~cellfun('isempty',GF{k}));
    end
end


    % Removendo as transições do CoAcessível em GFaux
for k=1:numel(GFaux)
    for i=2:numel(GFaux{k})
        if(GlCoAc(GFaux{k}{i}{1}(1),3)==0)
            GFaux{k}{i} = [];
        end
    end
    if (~isempty(GF{k}))
        GFaux{k} = GFaux{k}(~cellfun('isempty',GFaux{k}));
    end
end


% Tratando Gn pra aplicar o paralelo
Gnaux = Gn;
Gn = [];
for k=1:numel(Gnaux)  
    for i=2:numel(Gnaux{k})  
        Gn{k}{i-1} = [Gnaux{k}{i}{1}(1) Gnaux{k}{i}{2}];
    end
end
Gni = zeros(1,numel(Gn)); Gni(1) = 1;

% Zerando os estados marcados dos dois, desnecessário pro método
Gnm = zeros(1,numel(Gn));
GFm = zeros(1,numel(GF));

% Aplicando o paralelo para fazer Gv
[Gv,~] = Paralelo(Gn,Gnm,Gni,EGn,GF,GFm,GFi,EGF);

% Voltando com a forma de Gv com label de falhas
Gvaux = Gv;
Gv = [];
for k=1:numel(Gvaux)
    
    for i=1:numel(Gvaux{k})
        
        if(i==1)
            Gv{k}{i}{1} = Gnaux{Gvaux{k}{i}(1)}{1};
            Gv{k}{i}{2} = GFaux{Gvaux{k}{i}(2)}{1};
        else
            Gv{k}{i}{1}{1} = Gnaux{Gvaux{k}{i}{1}(1)}{1};
            Gv{k}{i}{1}{2} = GFaux{Gvaux{k}{i}{1}(2)}{1};
            Gv{k}{i}{2} = Gvaux{k}{i}{2};
        end
        
    end
    
end

end
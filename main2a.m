clc; clear all;

%% ------------------------ Entrada de Opera��o ------------------------ %%
Prod = 0; % Opera��o Produto
Par = 0; % Opera��o Paralelo

%% ------------------------ Entrada de Aut�mato ------------------------ %%

% Estrutura: Q{estado} = {[Destino1 Evento1] [Destino2 Evento2] ... }
Q{1} = {[2 1] [3 2]};
Q{2} = {[3 1] [1 2]};
Q{3} = {[1 1] [2 2]};
Qi = [1 0 0];
Qm = [0 1 0];
Eq = [1 2];

% Estrutura: S{estado} = {[Destino1 Evento1] [Destino2 Evento2] ... }
S{1} = {[2 1]};
S{2} = {[3 2] [1 3]};
S{3} = {[2 1] [4 3] [1 2]};
S{4} = {[1 1]};
Si = [1 0 0 0];
Sm = [0 1 0 0];
Es = [1 2 3];


%% ------------------------- Opera��o Produto -------------------------- %%
if (Prod == 1)
    
    [R,Rm] = Produto(Q,Qm,Qi,S,Sm,Si);

end

%% ------------------------- Opera��o Paralelo ------------------------- %%

if (Par == 1)
    
    [R,Rm] = Paralelo(Q,Qm,Qi,Eq,S,Sm,Si,Es);

end

clc; clear all;

%%------------------------- Entrada de Opera��o -------------------------%%
Prof = 0; % Busca em Profundidade
Ac = 1; % Parte Acess�vel


%%------------------------- Entrada de Aut�mato -------------------------%%

% Usando duas sa�das da fun��o Gamma em um estado:
% Q{1} = {[2 1]};
% Q{2} = {[1 2]};
% Q{3} = {[4 1] [1 2]};
% Q{4} = {[3 2]};

% Acessar valores: Q{1}{1}(1) por exemplo


%% ------------------- Chamando Busca em Profundidade ------------------ %%

if(Prof == 1)

% Estrutura: {[Destino Evento]}
Q{1} = {[2 1]};
Q{2} = {[3 1]};
Q{3} = {[2 2]};
Q{4} = {[2 1] [5 2]};
Q{5} = {[3 2] [6 3]};
Q{6} = {[4 1]};

Qi = [1 0 0 0 0 0];

Profundidade(Q,Qi)

end

%% -------------------------- Parte Acess�vel -------------------------- %%

if(Ac == 1)

% Estrutura: {[Destino Evento]}
Q{1} = {[2 1]};
Q{2} = {[3 1]};
Q{3} = {[2 2]};
Q{4} = {[2 1] [5 2]};
Q{5} = {[3 2] [6 3]};
Q{6} = {[4 1]};

Qm = [0 0 0 1 0 0];

Acessivel(Q,Qm)

end

%% -------------------------- Busca em Largura ------------------------- %%
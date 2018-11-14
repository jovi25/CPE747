clc; clear all;

tic

%%------------------------ Entrada de Autômatos -------------------------%%

Prod = 0;
Par = 1;

% Estrutura: {[Destino Evento]}
Q{1} = {[2 1] [3 2]};
Q{2} = {[3 1] [1 2]};
Q{3} = {[1 1] [2 2]};
Qi = [1 0 0];
Qm = [0 1 0];
Eq = [1 2];

S{1} = {[2 1]};
S{2} = {[3 2] [1 3]};
S{3} = {[2 1] [4 3] [1 2]};
S{4} = {[1 1]};
Si = [1 0 0 0];
Sm = [0 1 0 0];
Es = [1 2 3];


% Q{1} = {[2 1] [1 2]};
% Q{2} = {[1 1] [2 2]};
% Qi = [1 0];
% Qm = [1 0];
% 
% S{1} = {[1 1] [2 2]};
% S{2} = {[2 1] [1 2]};
% Si = [1 0];
% Sm = [1 0];

if (Prod == 1)
    
[R,Rm] = Produto(Q,Qm,Qi,S,Sm,Si);

end

if (Par == 1)
    
[R,Rm] = Paralelo(Q,Qm,Qi,Eq,S,Sm,Si,Es);

end

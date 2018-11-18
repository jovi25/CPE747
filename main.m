clc; clear all;

%%------------------------- Entrada de Opera��o -------------------------%%
Prof = 0; % Busca em Profundidade
Ac = 0; % Parte Acess�vel
Larg = 0; % Busca em Largura
CoAc = 0; % Parte CoAcess�vel
OrdTop = 0; % Ordenamento Topol�gico
CompFC = 0; % Componentes Fortemente Conexos
Obs = 1; % Observador

%%------------------------- Entrada de Aut�mato -------------------------%%

% Estrutura: {[Destino Evento]}
Q{1} = {[2 1]};
Q{2} = {[3 1]};
Q{3} = {[2 2]};
Q{4} = {[2 1] [5 2]};
Q{5} = {[3 2] [6 3]};
Q{6} = {[4 1]};

Qi = [1 0 0 0 0 0];

Qm = [0 0 0 0 0 1];


%% ------------------- Chamando Busca em Profundidade ------------------ %%

if(Prof == 1)

    Profundidade(Q,Qi)
    disp('Legenda do Resultado:');
    disp('Estados encontrados a partir do Estado Inicial escolhido');

end

%% -------------------------- Parte Acess�vel -------------------------- %%

if(Ac == 1)

    Acessivel(Q,Qi)
    disp('Legenda do Resultado:');
    disp('Estados Acess�veis a partir do Estado Inicial escolhido');
    
end

%% -------------------------- Busca em Largura ------------------------- %%

if(Larg == 1)

    Largura(Q)
    disp('Legenda do Resultado:');
    disp('Estados, Tempos de Encontro, Tempos Finais');
    
end

%% ------------------------- Parte CoAcess�vel ------------------------- %%

if(CoAc == 1)

CoAcessivel(Q,Qm)
disp('Legenda do Resultado:')
disp('Estados, Tempos de Encontro, Tempos Finais')


end

%% ----------------------- Ordenamento Topol�gico ---------------------- %%

if(OrdTop == 1)

OrdenamentoTop(Q)
disp('Legenda do Resultado:')
disp('Estados, Tempos de Encontro, Tempos Finais')


end

%% ------------------- Componentes Fortemente Conexos ------------------ %%

if(CompFC == 1)

SCC(Q)
disp('Legenda do Resultado:')
disp('Estados, Tempos de Encontro, Tempos Finais, Componentes Fortemente Conexos')

end


%% ----------------------------- Observador ---------------------------- %%

if(Obs == 1)

Q{1} = {[2 1]};
Q{2} = {[3 1]};
Q{3} = {[2 2] [1 3] [4 4]};
Q{4} = {[1 1] [3 3]};
Qi = [1 0 0 0];
Qm = [0 0 1 0];
Equo = [3 4];
    
[R,Rm] = Observador(Q,Qi,Qm,Equo);
disp('Legenda do Resultado:')
disp('C�lulas de {[Estado Destino] [Evento]}')

end
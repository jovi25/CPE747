clc; clear all;

%%------------------------- Entrada de Operação -------------------------%%
Prof = 0; % Busca em Profundidade
Ac = 0; % Parte Acessível
Larg = 0; % Busca em Largura
CoAc = 0; % Parte CoAcessível
OrdTop = 0; % Ordenamento Topológico
CompFC = 0; % Componentes Fortemente Conexos

%%------------------------- Entrada de Autômato -------------------------%%

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

%% -------------------------- Parte Acessível -------------------------- %%

if(Ac == 1)

    Acessivel(Q,Qi)
    disp('Legenda do Resultado:');
    disp('Estados Acessíveis a partir do Estado Inicial escolhido');
    
end

%% -------------------------- Busca em Largura ------------------------- %%

if(Larg == 1)

    Largura(Q)
    disp('Legenda do Resultado:');
    disp('Estados, Tempos de Encontro, Tempos Finais');
    
end

%% ------------------------- Parte CoAcessível ------------------------- %%

if(CoAc == 1)

CoAcessivel(Q,Qm)
disp('Legenda do Resultado:')
disp('Estados, Tempos de Encontro, Tempos Finais')


end

%% ----------------------- Ordenamento Topológico ---------------------- %%

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

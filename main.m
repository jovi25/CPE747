clc; clear all;

%% ------------------------ Entrada de Operação ------------------------ %%
Prof = 0; % Busca em Profundidade
Ac = 0; % Parte Acessível
Larg = 0; % Busca em Largura
CoAc = 0; % Parte CoAcessível
OrdTop = 0; % Ordenamento Topológico
CompFC = 0; % Componentes Fortemente Conexos
Obs = 0; % Observador
Diag = 0; % Diagnosticador
Verif = 0; % Verificador
Atraso = 0; % Atraso para Diagnóstico

%% ------------------------ Entrada de Autômato ------------------------ %%

% Estrutura: Q{estado} = {[Destino1 Evento1] [Destino2 Evento2] ... }

% Exemplo de atraso para diagnóstico do caderno
Q{1} = {[2 1]};
Q{2} = {[3 1]};
Q{3} = {[2 2]};
Q{4} = {[2 1] [5 2]};
Q{5} = {[3 2] [6 3]};
Q{6} = {[4 1]};
Qi = [1 0 0 0 0 0];
Qm = [0 0 0 0 0 1];
    

%% ----------------------- Busca em Profundidade ----------------------- %%

if(Prof == 1)
    
    disp('Legenda do Resultado:');
    disp('Estados encontrados a partir do Estado Inicial escolhido');
    Profundidade(Q,Qi)

end

%% ------------------------- Autômato Acessível ------------------------ %%

if(Ac == 1)

    [EstadosAc,Qac] = AutomatoAcessivel(Q,Qi);
    disp('Legenda do Resultado:');
    disp('Estados Acessíveis a partir do Estado Inicial escolhido');
    disp(EstadosAc)
    disp('Autômato Acessível');
    disp(Qac)
    
end

%% -------------------------- Busca em Largura ------------------------- %%

if(Larg == 1)

    disp('Legenda do Resultado:');
    disp('Estados, Tempos de Encontro, Tempos Finais');
    Largura(Q)
    
end

%% ------------------------ Autômato CoAcessível ----------------------- %%

if(CoAc == 1)

    [EstadosCoAc,QCoAc] = AutomatoCoAcessivel(Q,Qm);
    disp('Legenda do Resultado:')
    disp('Estados CoAcessíveis a partir do Estado Inicial escolhido');
    disp(EstadosCoAc)
    disp('Autômato CoAcessível');
    disp(QCoAc)


end

%% ----------------------- Ordenamento Topológico ---------------------- %%

if(OrdTop == 1)

    disp('Legenda do Resultado:')
    disp('Estados, Tempos de Encontro, Tempos Finais')
    OrdenamentoTop(Q)

end

%% ------------------- Componentes Fortemente Conexos ------------------ %%

if(CompFC == 1)

    disp('Legenda do Resultado:')
    disp('Estados, Tempos de Encontro, Tempos Finais, Componentes FC')
    SCC(Q)
    
end


%% ----------------------------- Observador ---------------------------- %%

if(Obs == 1)

    [OBS,OBSm] = Observador(Q,Qi,Qm,E,Eqo);
    disp('Legenda do Resultado:')
    disp('Células de { {[Estado Atual]} {[Estado Destino] [Evento]} }')

end

%% ------------------------- Diagnosticador ---------------------------- %%

if(Diag == 1)

    Gd = Diagnosticador(Q,Qi,Qm,E,Eqo);
    disp('Legenda do Resultado:')
    disp('Células de { {[Estado Atual]} {[Estado Destino] [Evento]} }')

end

%% --------------------------- Verificador ----------------------------- %%

if(Verif == 1)

    Gv = Verificador(Q,Qm,Qi,Eq,Eqo,Equo,Eqf);
    disp('Legenda do Resultado:')
    disp('Células de { {[Estado Atual]} {[Estado Destino] [Evento]} }')

end

%% --------------------------- Verificador ----------------------------- %%

if(Atraso == 1)
    
    disp('Legenda do Resultado:')
    disp('Atraso:')
    AtrasoParaDiagnostico(Q,Qm,Qi,Eq,Eqo,Equo,Eqf)
    
end
clc; clear all;

%% ------------------------ Entrada de Opera��o ------------------------ %%
Prof = 0; % Busca em Profundidade
Ac = 0; % Parte Acess�vel
Larg = 0; % Busca em Largura
CoAc = 0; % Parte CoAcess�vel
OrdTop = 0; % Ordenamento Topol�gico
CompFC = 0; % Componentes Fortemente Conexos
Obs = 0; % Observador
Diag = 0; % Diagnosticador
Verif = 0; % Verificador
Atraso = 0; % Atraso para Diagn�stico

%% ------------------------ Entrada de Aut�mato ------------------------ %%

% Estrutura: Q{estado} = {[Destino1 Evento1] [Destino2 Evento2] ... }

% Exemplo de atraso para diagn�stico do caderno
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

%% ------------------------- Aut�mato Acess�vel ------------------------ %%

if(Ac == 1)

    [EstadosAc,Qac] = AutomatoAcessivel(Q,Qi);
    disp('Legenda do Resultado:');
    disp('Estados Acess�veis a partir do Estado Inicial escolhido');
    disp(EstadosAc)
    disp('Aut�mato Acess�vel');
    disp(Qac)
    
end

%% -------------------------- Busca em Largura ------------------------- %%

if(Larg == 1)

    disp('Legenda do Resultado:');
    disp('Estados, Tempos de Encontro, Tempos Finais');
    Largura(Q)
    
end

%% ------------------------ Aut�mato CoAcess�vel ----------------------- %%

if(CoAc == 1)

    [EstadosCoAc,QCoAc] = AutomatoCoAcessivel(Q,Qm);
    disp('Legenda do Resultado:')
    disp('Estados CoAcess�veis a partir do Estado Inicial escolhido');
    disp(EstadosCoAc)
    disp('Aut�mato CoAcess�vel');
    disp(QCoAc)


end

%% ----------------------- Ordenamento Topol�gico ---------------------- %%

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
    disp('C�lulas de { {[Estado Atual]} {[Estado Destino] [Evento]} }')

end

%% ------------------------- Diagnosticador ---------------------------- %%

if(Diag == 1)

    Gd = Diagnosticador(Q,Qi,Qm,E,Eqo);
    disp('Legenda do Resultado:')
    disp('C�lulas de { {[Estado Atual]} {[Estado Destino] [Evento]} }')

end

%% --------------------------- Verificador ----------------------------- %%

if(Verif == 1)

    Gv = Verificador(Q,Qm,Qi,Eq,Eqo,Equo,Eqf);
    disp('Legenda do Resultado:')
    disp('C�lulas de { {[Estado Atual]} {[Estado Destino] [Evento]} }')

end

%% --------------------------- Verificador ----------------------------- %%

if(Atraso == 1)
    
    disp('Legenda do Resultado:')
    disp('Atraso:')
    AtrasoParaDiagnostico(Q,Qm,Qi,Eq,Eqo,Equo,Eqf)
    
end
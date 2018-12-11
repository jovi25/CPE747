function Gd = Diagnosticador(Q,Qi,Qm,Eq,Eqo)

% Al
Al{1} = {[2 0]};
Al{2} = {[2 0]};
Ali = [1 0];
Alm = [0 0];
EAl = [0];

% Gl
[Gl,~] = Paralelo(Q,Qm,Qi,Eq,Al,Alm,Ali,EAl);
EGl = Eq; EGlo = Eqo; Gli = 1;

% Gd
[Gd] = ObservadorPP(Gl,Gli,EGl,EGlo);

end

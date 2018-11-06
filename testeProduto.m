clc; clear all;

%%------------------------ Entrada de Autômatos -------------------------%%

% Estrutura: {[Destino Evento]}
Q{1} = {[2 1] [3 2]};
Q{2} = {[3 1] [1 2]};
Q{3} = {[1 1] [2 2]};
Qi = [1 0 0];
EQ = [1 2];


S{1} = {[2 1]};
S{2} = {[3 2] [1 3]};
S{3} = {[2 1] [4 3] [1 2]};
S{4} = {[1 1]};
Si = [1 0 0 0];
ES = [1 2 3];


% Encontrando os estados iniciais

sini = find(Si == 1);
sa = sini;
qini = find(Qi == 1);
qa = qini;

% Produto

done=0; iget=0; iset=0;
while not (done)
    iget = iget + 1;
    for k=1:numel(Q{qa})
        i=0;
        auxq1 = Q{qa}{k}(1);
        auxq2 = Q{qa}{k}(2);
        for j=1:numel(S{sa})
            auxs1 = S{sa}{j}(1);
            auxs2 = S{sa}{j}(2);
            if(auxq2 == auxs2)
                i=i+1;
                iset=iset+1;
                R{iget}{i}={[auxq1 auxs1] auxs2};
                qnext(iset) = auxq1;
                snext(iset) = auxs1;
            end
        end
    end
        
    done1 = 1*(qa==qnext(end));
    qa = qnext(iget);
    done2 = 1*(qa==qini);
%     done = 1*(done1+done2);
    sa = snext(iset);

end
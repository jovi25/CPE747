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

snext(1) = find(Si == 1);
qnext(1) = find(Qi == 1);

% Produto

done=0; iget=1; iset=1;
while not (done)
    qa = qnext(iget);
    sa = snext(iset);
    if(qa==0)
        qa=qnext(iget+1);
    end
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
                if(ismember(auxq1,qnext) && ismember(auxs1,snext))
                    %k=k+1;
                else
                    qnext(iset) = auxq1;
                    snext(iset) = auxs1;
                end
            end
        end
    end
    

    iget=iget+1;
    
    done1 = 1*(qa==qnext(end));
    

end
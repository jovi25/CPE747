clc; clear all;

% Falta Marcar os Estados

%%------------------------ Entrada de Autômatos -------------------------%%

% Estrutura: {[Destino Evento]}
Q{1} = {[2 1] [3 2]};
Q{2} = {[3 1] [1 2]};
Q{3} = {[1 1] [2 2]};
Qi = [1 0 0];
EQ = [1 2];
Qm = [0 1 0];

S{1} = {[2 1]};
S{2} = {[3 2] [1 3]};
S{3} = {[2 1] [4 3] [1 2]};
S{4} = {[1 1]};
Si = [1 0 0 0];
ES = [1 2 3];
Sm = [0 1 0 0];


% Encontrando os estados iniciais

snext(1) = find(Si == 1);
qnext(1) = find(Qi == 1);
Reach(1,:) = [snext(1) qnext(1)];

% Produto

wdone=0; iget=0; iset=1;
while wdone==0
    i=0;
    iget = iget+1; 
    
    if(iget>length(qnext))
        break
    end
    
    qa = qnext(iget);
    ihelp = 0;
    if(qa==0)
        while(qa==0)
            ihelp=ihelp+1;
            qa = qnext(iget+ihelp);
        end
    end
    
    
    sa = snext(iget);
    ihelp=0;
    if(sa==0)
        while(sa==0)
            ihelp=ihelp+1;
            sa = snext(iget+ihelp);
        end
    end
    
    
    for k=1:numel(Q{qa})
        
        auxq1 = Q{qa}{k}(1);
        auxq2 = Q{qa}{k}(2);
        
        for j=1:numel(S{sa})
            
            auxs1 = S{sa}{j}(1);
            auxs2 = S{sa}{j}(2);
            
            if(auxq2 == auxs2)
                
                i=i+1;
                iset=iset+1;
%                 R{iget}{i}={[auxq1 auxs1] auxs2};
                
                
                jump=0;
                for m=1:length(Reach(:,1)) 
                    if (Reach(m,1)==auxq1 && Reach(m,2)==auxs1)
                        jump=1;
                    end
                end
                
                if(jump==0)
                    R{iget}{i}={[auxq1 auxs1] auxs2};
                    qnext(iset) = auxq1;
                    snext(iset) = auxs1;
                    Reach(iget,:) = [auxq1 auxs1];
                    
                end
                
            end
        end
    end

end


R = R(~cellfun('isempty',R));

% for k=1:numel(R)
%     for j=1:numel(R{k})
%         
%         R{k}{j}
%         
%     end
% end

clc; clear all;

% Falta Marcar os Estados

%%------------------------ Entrada de Autômatos -------------------------%%

% Estrutura: {[Destino Evento]}
Q{1} = {[2 1] [3 2]};
Q{2} = {[3 1] [1 2]};
Q{3} = {[1 1] [2 2]};
Qi = [1 0 0];
Qm = [0 1 0];

S{1} = {[2 1]};
S{2} = {[3 2] [1 3]};
S{3} = {[2 1] [4 3] [1 2]};
S{4} = {[1 1]};
Si = [1 0 0 0];
Sm = [0 1 0 0];


% Q{1} = {[2 1] [1 2]};
% Q{2} = {[1 1] [2 2]};
% Qi = [1 0];
% Qm = [1 0];
% 
% S{1} = {[1 1] [2 2]};
% S{2} = {[2 1] [1 2]};
% Si = [1 0];
% Sm = [1 0];



% Encontrando os estados iniciais

qnext(1) = find(Qi == 1);
snext(1) = find(Si == 1);
Reach(1,:) = [qnext(1) snext(1)];

R{1}{1} = {[qnext(1) snext(1)]};

% Produto

iget=0; iset=1; l=1; ir=0; saant=0; ireach=1;
while 1
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
    
    if(saant~=sa || qaant~=qa)
        ir = ir+1;
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
                
                if(i>1)
                    R{ir}{i-1}={[qa sa] [qhelp shelp] thelp};
                end
                    
                R{ir}{i}={[qa sa] [auxq1 auxs1] auxs2};
                
                qhelp=auxq1;
                shelp=auxs1;
                thelp=auxq2;
                
                
                if(Qm(qa)==1 && Sm(sa)==1)
                    Rm(ir)=1;
                else
                    Rm(ir)=0;
                end
                
                
                
                % Verificando se o produto já passou pelo estado futuro
                jump=0;
                for m=1:length(Reach(:,1)) 
                    if (Reach(m,1)==auxq1 && Reach(m,2)==auxs1)
                        jump=1;
                    end
                end
   
                
                if(jump==0)
                    
                    ireach=ireach+1;
                    qnext(iset) = auxq1;
                    snext(iset) = auxs1;
                    Reach(ireach,:) = [auxq1 auxs1];   
                    
                end
                
            end
        end
    end
    saant = sa;
    qaant = qa;
end

R = R(~cellfun('isempty',R));

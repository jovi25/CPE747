function [R,Rm] = Produto(Q,Qm,Qi,S,Sm,Si)

qnext(1) = find(Qi == 1);
snext(1) = find(Si == 1);
Reach(1,:) = [qnext(1) snext(1)];

% Produto

wdone=0; iget=0; iset=1; l=1; qhelp=0;
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
        
        if(~isempty(Q{qa}{k}))
            auxq1 = Q{qa}{k}(1);
            auxq2 = Q{qa}{k}(2);
        else
            k=k+1;
        end

        
        for j=1:numel(S{sa})
            
            if(~isempty(S{sa}{j}))
                auxs1 = S{sa}{j}(1);
                auxs2 = S{sa}{j}(2);
            else
            j=j+1;
            end
            
            if(auxq2 == auxs2)
                
                i=i+1;
                iset=iset+1;                
                
                jump=0;
                for m=1:length(Reach(:,1)) 
                    if (Reach(m,1)==auxq1 && Reach(m,2)==auxs1)
                        jump=1;
                        qhelp=auxq1;
                        shelp=auxs1;
                        thelp=auxq2;
                    end
                end
                
                if(jump==0)
                    
                    if(i>1 && qhelp~=0)
                        R{iget}{i-1}={[qhelp shelp] thelp};
                    end
                    
                    R{iget}{i}={[auxq1 auxs1] auxs2};
                    qnext(iset) = auxq1;
                    snext(iset) = auxs1;
                    Reach(iget,:) = [auxq1 auxs1];
                    
                    l=l+1;
                    if(Qm(auxq1)==1 && Sm(auxs1)==1)
                        Rm(l)=1;
                    else
                        Rm(l)=0;
                    end
                    
                    
                end
                
            end
        end
    end

end

R = R(~cellfun('isempty',R));

end
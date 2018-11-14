function [R,Rm] = Paralelo(Q,Qm,Qi,Eq,S,Sm,Si,Es)

% Verificando transições dependentes e independentes

i=0; j=0;
for k=1:length(Eq)
    if(ismember(Eq(k),Es))
        i=i+1;
        Dep(i)=Eq(k);
    else
        j=j+1;
        Indq(j)=Eq(k);
    end
end
j=0;
for n=1:length(Es)
    if(ismember(Es(n),Eq))
        if(~ismember(Es(n),Dep))
            Dep(i)=Es(n);
        end
    else
        j=j+1;
        Inds(j)=Es(n);
    end
end

if(length(Es)>length(Dep))
    for k=1:numel(Q)
        for n=1:length(Inds)
            Q{k}{end+1} = [k Inds(n)];
        end
    end
end

if(length(Eq)>length(Dep))
    for k=1:numel(S)
        for n=1:length(Indq)
            S{k}{end+1} = [k Indq(n)];
        end
    end
end

[R,Rm] = Produto(Q,Qm,Qi,S,Sm,Si);

end
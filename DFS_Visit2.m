function [Q,Qp,time] = DFS_Visit2(Q,Qp,u,time,c)

time = time + 1;

Qp(u,2) = time;
Qp(u,1) = 1;

for k=1:numel(Q{u})
    v = Q{u}{k}(1);
    if(Qp(v,1)==0)
        Qp(v,2) = u;
        Qp(v,5) = c;
        [Q,Qp,time] = DFS_Visit2(Q,Qp,v,time,c);
    end
end

Qp(u,1) = 2;
time = time + 1;
Qp(u,4) = time;

end
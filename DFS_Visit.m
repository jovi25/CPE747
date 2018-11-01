function [Q,Qp,time] = DFS_Visit(Q,Qp,u,time)

time = time + 1;

Qp(u,2) = time;
Qp(u,1) = 1;

for k=1:numel(Q{u})
    v = Q{u}{k}(1);
    if(Qp(v,1)==0)
        Qp(v,2) = u;
        [Q,Qp,time] = DFS_Visit(Q,Qp,v,time);
    end
end

Qp(u,1) = 2;
time = time + 1;
Qp(u,4) = time;

end
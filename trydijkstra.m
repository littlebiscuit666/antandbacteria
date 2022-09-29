%% Dijkstra最短路
function [distance,path]=trydijkstra(map,sb,db)
n=size(map,1);visited(1,n)=0;
distance(1:n)=inf;distance(sb)=0;
visited(sb)=1;u=sb;
parent(1:n)=0;
for i=1:n-1
    id=find(visited==0);
    for v=id
        if map(u,v)+distance(u)<distance(v)
            distance(v)=distance(u)+map(u,v);
            parent(v)=u;
        end
    end
    temp=distance;
    temp(visited==1)=inf;
    [t,u]=min(temp);
    visited(u)=1;
end
path=[];
if parent(db)~=0
    t=db;path=[db];
    while t~=sb
        P=parent(t);
        path=[P path];
        t=P;
    end
end
distance=distance(db);





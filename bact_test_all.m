clc,clear 
% D=[0,3,4;3,0,5;4,5,0];
% L=ones(3,3);
% P=bact_form_function(D,L);
% 上面的地方调用一下，看一下效果
clc,clear;
L=[0 10 14 10;10 0 10 14;14 10 0 10;10 14 10 0];
D=ones(4);
Q=zeros(4);
N=0;
flag=0;flagtwo=0;
sensity=10^(-5);
while N<50
    [xishu,P]=bact_form_function(D,L);
    W=D./L;
    W(logical(eye(size(W))))=0;
    for i=1:size(Q,1)
        for j=1:i
            Q(i,j)=W(i,j)*(P(i)-P(j));
            Q(j,i)=Q(i,j);
        end
    end
    D_find=D;
    D=Q./(1+Q);
    D_find=abs(D_find-D);
    for k=2:size(Q,1)
        for r=1:k-1
            if D_find(k,r)<sensity
                flag=1;
                break;
            end
        end
        if flag==1
            flagtwo=1;
        end
    end
    if flagtwo==1
        break
    end
    N=N+1;
end
%% 要寻找两点的最短路的话，可以基于D使用Dijk寻找
D_dijk=D;
alter=find(D==0);
D_dijk(alter)=inf;
sb=1;db=4;
[distance,path]=trydijkstra(D_dijk,sb,db);







%% 忆阻器和黏菌的组合（忆阻器阵列）
% Dij Lij ———— Gij 不变
% Pi ———— Pij
% Gij*Pij ———— Iij
% Iij ———— Ii
% Ii Pi ———— Pi

clc,clear;
L=[0 10 14 10;10 0 10 14;14 10 0 10;10 14 10 0]; % map是[1,4;2,3]
D=ones(4,4);
G=D./L;
P=zeros(4,4);
G(logical(eye(size(G))))=0;
%% 计算Pij
% p=rand(4,1);
p=[0.8;0.6;0.4;0.2];
for i=1:4
    for j=1:i
        P(i,j)=p(i)-p(j);
        P(j,i)=P(i,j);
    end
end
%% 计算Iij
I=zeros(4,4);
I=G.*P;
I(logical(eye(size(G))))=0;
i=sum(I,2); % 按每一行相加，4行一列
p_right=i+G*p;
% G*p(n)=i+G*p(n-1)=p_right
p=G\p_right;



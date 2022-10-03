%%
clc,clear;
L=[0 10 14 10;10 0 10 14;14 10 0 10;10 14 10 0]; % map是[1,4;2,3]
D=ones(4,4);
G=D./L;
P=zeros(4,4);
G(logical(eye(size(G))))=0;
%% 计算Pij
% p=rand(4,1);
p=[0.8;0.6;0.4;0.2];
% p=[0.2;0.4;0.6;0.8];
n=0;
p_page=zeros(4,30);
i_page=zeros(4,30);
while n<25
    for i=1:4
        for j=1:i
            P(i,j)=p(i)-p(j);
            P(j,i)=P(i,j);
        end
    end
    %% 计算Iij
    I=zeros(4,4);
    I=G.*P*(1*10^(-1)); % 文章中V=P*(1*10^(-2))，否则会不收敛？
    I(logical(eye(size(G))))=0;
    i=sum(I,2); % 按每一行相加，4行一列
    right_p=i+G*p;
    % G*p(n)=i+G*p(n-1)=p_right
    p=G\right_p;
    n=n+1;
    p_page(:,n)=p;
    i_page(:,n)=i;
end
loc1=p_page(1,:);
loc2=p_page(2,:);
loc3=p_page(3,:);
change_page=zeros(4,30);
for i=1:25 
    percent=abs((loc1(i+1)-loc1(i))/loc1(i));
    change_page(1,i)=percent;
    percent=abs((loc2(i+1)-loc2(i))/loc2(i));
    change_page(2,i)=percent;
    percent=abs((loc3(i+1)-loc3(i))/loc3(i));
    change_page(3,i)=percent;
end
% 不是收敛的


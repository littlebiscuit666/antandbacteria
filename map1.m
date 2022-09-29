%% 把field矩阵中的某些元素（相同）替换为另一种元素（相同）
% a=[2,3,4,5,56
%     3,2,4,5,5];
% b=find(a==5);
% a(b)=1;
%% 制作一个地图
clc,clear
rows = 5;
cols = 5;
field = ones(rows, cols);
startPos = 1;
goalPos = rows*cols;
field(startPos) = 4;
field(goalPos) = 5;
%
field(2,2)=2;
field(1,4)=2;
field(3,3)=2;
%%
image(1.5,1.5,field);
grid on;
set(gca,'gridline','-','gridcolor','k','linewidth',2,'GridAlpha',0.5);
set(gca,'xtick',1:cols+1,'ytick',1:rows+1);
axis image;

%% 构建颜色MAP图
cmap = [1 1 1; ...       % 1-白色-空地
    0 0 0; ...           % 2-黑色-静态障碍
    1 0 0; ...           % 3-红色-动态障碍
    1 1 0;...            % 4-黄色-起始点 
    1 0 1;...            % 5-品红-目标点
    0 1 0; ...           % 6-绿色-到目标点的规划路径   
    0 1 1];              % 7-青色-动态规划的路径
% 红绿蓝RGB
% 构建颜色MAP图
colormap(cmap);

%% 建立邻接矩阵
% 有障碍栅格及非相邻栅格设为0
% 对于这个题的field，最后应该是25*25的矩阵
field1=field;
a=find(field1~=1);
field1(a)=0;
field1(1)=1;
field1(rows*cols)=1;
% 把元素变为0/1矩阵，0为无法经过，1可已经过
D=G2D(field1);
D1=D;
b=find(D1==0);
D1(b)=inf;
% D1=D1-diag(diag(D1));
% c=find(isnan(D1));
D1(logical(eye(size(D1))))=0;

%% 计算最短路
% 我怀疑是dijstra错了
% 并不是，邻接矩阵，不相邻的用inf
sb=1;
db=25;
[distance,path]=trydijkstra(D1,sb,db);

%% 显示路径
figure(2);
title('Dijkstra算法');
field_Dijk=field;
field_Dijk(path(2:end-1))=7;
image(1.5,1.5,field_Dijk);
grid on;
set(gca,'gridline','-','gridcolor','k','linewidth',2,'GridAlpha',0.5);
set(gca,'xtick',1:cols+1,'ytick',1:rows+1);
axis image;
colormap(cmap);

%% 形如D1的邻接矩阵
%% 是Dijkstra算法的邻接矩阵：对角线为0，无法到达的是inf



% %% 绘图
% plotif=1;%是否绘图的控制参数
%  if plotif==1 %绘收敛曲线
%     minPL=zeros(K); 
%    for i=1:K 
%      PLK=PL(i,:); 
%      Nonzero=find(PLK); 
%      PLKPLK=PLK(Nonzero); 
%      minPL(i)=min(PLKPLK); 
%    end 
% figure(1) 
% plot(minPL); 
% hold on 
% grid on 
% title('收敛曲线变化趋势'); 
% xlabel('迭代次数'); 
% ylabel('最小路径长度'); %绘爬行图
% figure(2) 
% axis([0,MM,0,MM]) 
% for i=1:MM 
% for j=1:MM 
% if G(i,j)==1 
% x1=j-1;y1=MM-i; 
% x2=j;y2=MM-i; 
% x3=j;y3=MM-i+1; 
% x4=j-1;y4=MM-i+1; 
% fill([x1,x2,x3,x4],[y1,y2,y3,y4],[0.2,0.2,0.2]); 
% hold on 
% else 
% x1=j-1;y1=MM-i; 
% x2=j;y2=MM-i; 
% x3=j;y3=MM-i+1; 
% x4=j-1;y4=MM-i+1; 
% fill([x1,x2,x3,x4],[y1,y2,y3,y4],[1,1,1]); 
% hold on 
% end 
% end 
% end 
% hold on 
% title('机器人运动轨迹'); 
% xlabel('坐标x'); 
% ylabel('坐标y');
% ROUT=ROUTES{mink,minl}; 
% LENROUT=length(ROUT); 
% Rx=ROUT; 
% Ry=ROUT; 
% for ii=1:LENROUT 
% Rx(ii)=a*(mod(ROUT(ii),MM)-0.5); 
% if Rx(ii)==-0.5 
% Rx(ii)=MM-0.5; 
% end 
% Ry(ii)=a*(MM+0.5-ceil(ROUT(ii)/MM)); 
% end 
% plot(Rx,Ry) 
% end 
% plotif2=0;%绘各代蚂蚁爬行图
% if plotif2==1 
% figure(3) 
% axis([0,MM,0,MM]) 
% for i=1:MM 
% for j=1:MM 
% if G(i,j)==1 
% x1=j-1;y1=MM-i; 
% x2=j;y2=MM-i; 
% x3=j;y3=MM-i+1; 
% x4=j-1;y4=MM-i+1; 
% fill([x1,x2,x3,x4],[y1,y2,y3,y4],[0.2,0.2,0.2]); 
% hold on 
% else 
% x1=j-1;y1=MM-i; 
% x2=j;y2=MM-i; 
% x3=j;y3=MM-i+1; 
% x4=j-1;y4=MM-i+1; 
% fill([x1,x2,x3,x4],[y1,y2,y3,y4],[1,1,1]); 
% hold on 
% end 
% end 
% end 
% for k=1:K 
% PLK=PL(k,:); 
% minPLK=min(PLK); 
% pos=find(PLK==minPLK); 
% m=pos(1); 
% ROUT=ROUTES{k,m}; 
% LENROUT=length(ROUT); 
% Rx=ROUT; 
% Ry=ROUT; 
% for ii=1:LENROUT 
% Rx(ii)=a*(mod(ROUT(ii),MM)-0.5); 
% if Rx(ii)==-0.5 
% Rx(ii)=MM-0.5; 
% end 
% Ry(ii)=a*(MM+0.5-ceil(ROUT(ii)/MM)); 
% end 
% plot(Rx,Ry) 
% hold on 
% end 
% end 


% 提取有理分式的分子分母:[n,d]=nuden(s)
% 提取符号表达式的系数:c=coeffs(s,x)
% 符号表达式化简:simplify(s)
% 符号多项式与多项式系数向量之间的转换：
% 符号多项式转换为多项式系数向量:p=sym2poly(s)
% 多项式系数向量转换为符号多项式:s=poly2sym(p)

% a=coeffs(form_arr(1))
% b=coeffs(form_arr(2))
% c=coeffs(form_arr(3))
% a = fliplr(a)
% b = fliplr(b)
% c = fliplr(c)
% c=double(c)

%% 定义变量的方法
for i=1:n 
    syms(['x',num2str(i)]);  %x1、x2、x3。。。。
end
% 先定义cell_tube_p的数据类型为cell
% p = sym(ones(1,n));
% p = sym(1,n); 这个是错的
% 刚开始使用的是元胞类型
% p=cell(1,n) % 这个是1×3 cell数组
% p=cell(ones(1,n)) % 这个是1×1 cell数组
% 成功的方法
% for i=1:n
%     p(i)=(['x',num2str(i)]);
% end

%% 我理解的信息素矩阵
% Q矩阵(i,j)位置指的是从节点i流入节点j的信息素流量
% 这个可以计算每一个节点流量的变化
clc,clear
Q=[0,3,2,4;1,0,9,2;4,7,0,3;2,3,4,0];
[n,~]=size(Q);
addlist=zeros(1,n);
droplist=zeros(1,n);
for i=1:n
    list=1:n;
    list(i)=[]; % 删除
    add=0;
    drop=0;
    for j=list
        add=Q(j,i)+add;
        drop=drop-Q(i,j);
    end
    addlist(i)=add;
    droplist(i)=drop;
end
Qchange=addlist+droplist;


%% 获取对角线以下的元素
% A=[1,2,3;4,5,6;7,8,9];
% for j=2:3
%     for i=1:j-1
%         A(j,i)
%     end
% end
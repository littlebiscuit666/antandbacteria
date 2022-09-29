%% 计算A的n次方
clc,clear
A=[1,2,3;4,5,6;7,8,9];
% 分开的话
B=A;
for i=1:2
    A=A*B;
end
% 合起来的话
C=B*B*B;

% 删除数组中的元素
A=[3,2,4,1,5,6];
A([3,4,5])=[];

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

%%
% tube有两个属性：长度（对应L矩阵）、大小（对应D，传导性D=pi*r/n）
% n为粘黏系数，影响传导性
% 在算法中，每一次迭代的结果和最后结果通过D来得到
L=[0,3,4;3,0,5;4,5,0];
D=ones(3);
aaa=D./L;


%% 建立方程的部分
% 定义多个变量
% for i=1:10
%     syms (['x',num2str(i)]);    %x1、x2、x3。。。。
% end
clc,clear
D=[0,3,4;3,0,5;4,5,0];
syms p1 p2 p3
cell_tube_p=[p1,p2,p3]; % 我刚开始把这个命名成了cell
[n,~]=size(D);
form_arr=sym(zeros(n,1)); % 那么这个地方会先调用变量名，而不是元胞函数
for i=1:3
    cellnew=cell_tube_p;
    cellnew(i)=[];
    col=D(i,:);
    col(i)=[];
    form=0;
    for j=1:length(cellnew)
        form=col(j)*(cell_tube_p(i)-cellnew(j))+form;
        form_arr(i)=form;
    end
%     fid = fopen('d:/1test/jr_form.txt', 'a');
%     fprintf(fid, '%s\n', form);
%     fclose(fid);   
end
fid = fopen('d:/1test/jr_form.txt', 'a');
fprintf(fid, '%s\n', form_arr);
fclose(fid);
%% 通过form_arr获得方程组
xishu=zeros(n);
right=[1;zeros(n-2,1);-1];
for i=1:n
    xishu(i,:)=double(fliplr(coeffs(form_arr(i))));
end
cell_tube_p=xishu\right;
% 成功了！！！！！！
% xishu*cell_tube_p,计算结果是对的











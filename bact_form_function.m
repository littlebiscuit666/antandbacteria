function [xishu,tube_p]=bact_form_function(D,L)
% 这部分解决的是计算黏菌算法的压强的部分
% 输入样例
% D=[0,3,4;3,0,5;4,5,0];
% L=ones(3,3);
% W=D./L;
% 输出样例
% tube_p=[0.2721,0.3785,0.4423]
%% 第一部分:定义n个符号变量，并写入tube_p
W=D./L;
W(logical(eye(size(W))))=0;
[n,~]=size(W);
tube_p=sym(ones(1,n));
for i=1:n
    tube_p(1,i)=['x',num2str(i)];  
end
%% 根据JR列方程，并写入.txt文件
form_arr=sym(zeros(n,1)); % 最后得到的方程组左侧
for i=1:n
    cellnew=tube_p;
    cellnew(i)=[];
    col=W(i,:);
    col(i)=[];
    form=0;
    for j=1:length(cellnew)
        form=col(j)*(tube_p(i)-cellnew(j))+form;
        form_arr(i)=form;
    end  
end
fid = fopen('d:/1test/jr_form.txt', 'a');
fprintf(fid, '%s\n', form_arr);
fclose(fid);

%% 解方程,结果记入tube_p
xishu=zeros(n);
right=[-1;zeros(n-2,1);1]; % 方程右侧的数值,但是[1,0,0,0,-1]还是[-1,0,0,0,1]
for i=1:n
    xishu(i,:)=double(fliplr(coeffs(form_arr(i))));
end
tube_p=xishu\right;

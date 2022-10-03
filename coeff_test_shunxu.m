clc,clear
syms a b c d
y=8*b-3*a+4*b-c+d;
pp=coeffs(y);

syms a b c d
y=3*a+4*b-c+6*d;
pp=coeffs(y,[c,d,a,b]);
% 输出是[4,3,6,-1],他不是按照[c,d,a,b]的顺序给出的，是按照从右往左的顺序写入的！
% 可以说是明白了，如果后面什么也没写，就是默认的顺序[x1,x2,x3...]。求出来需要反一下。
% 或者可以写成[x5,x4,x3,x2,x1],然后就不用翻转了。
pp1=coeffs(y,[a,b,c,d]);


% 这部分解决的是计算黏菌算法的压强的部分
% 输入样例
clc,clear
D=[0,3,4;3,0,5;4,5,0];
L=ones(3,3);
W=D./L;
% 输出样例
% tube_p=[0.2721,0.3785,0.4423]
%% 第一部分:定义n个符号变量，并写入tube_p
W=D./L;
W(logical(eye(size(W))))=0;
[n,~]=size(W);
tube_p=sym(ones(1,n));
for i=1:n
    tube_p(1,i)=['x',num2str(i)];
    syms(['x',num2str(i)])
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
fid = fopen('d:/1test/jr1_form.txt', 'a');
fprintf(fid, '%s\n', form_arr);
fprintf(fid,'%s\n', 'sep');
fclose(fid);

%% 解方程,结果记入tube_p
xishu=zeros(n);
right=[-1;zeros(n-2,1);1]; % 方程右侧的数值,但是[1,0,0,0,-1]还是[-1,0,0,0,1]
for i=1:n
     xishu(i,:)=double(fliplr(coeffs(form_arr(i),tube_p)));           % [-4,-3,7]，什么都不干是错的
  % xishu(i,:)=double(fliplr((coeffs(form_arr(i)))));    % [7,-3,-4]是对的
  % xishu(i,:)=double((coeffs(form_arr(i),[x3,x2,x1]))); % [7,-3,-4]是对的
  % xishu(i,:)=double(fliplr((coeffs(form_arr(i),tube_p))))
  % 我不知道为什么参数[x1,x2,x3]没有起到调节顺序的作用
  % xishu(i,:)=double((coeffs(form_arr(i),tube_p)));     % [-4,-3,7]是错的
  % 这个地方会出现异常，因为coeff
  % 如果是 3*x+5*y-0*z 的话，返回值是[3,5]而不是[3,5,0]
  % 这就导致了数组大小不匹配，可能需要重新写一个函数
end
tube_p=xishu\right;
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
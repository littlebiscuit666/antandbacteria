%% 栅格地图G转换成邻接矩阵D，G2D函数
% 在D矩阵中元素行下标第一个节点在栅格G中的位置，列下标代表第二个节点在栅格G中的位置，
% 若这两个节点在栅格地图中是自由栅格且是相邻或者对角的，则两点的距离则为邻接矩阵D的元素值，否则D的元素值为0
% 通过对栅格矩阵G的两次搜索遍历，寻找两个相邻或对角的自由栅格，计算它们之间的距离
function D=G2D(G)
h=size(G,1);
D=zeros(h*h,h*h);
%用i表示矩阵G的行下标，j表示矩阵G的列下标。这是外层嵌套循环，表示第一个自由栅格
%用m表示矩阵G的行下标，n表示矩阵G的列下标。这是内层嵌套循环，表示第二个自由栅格
for i=1:h      %外层嵌套，遍历矩阵G
    for j=1:h
        if G(i,j)==1    %自由栅格是1，确定第一个自由栅格
            for m=1:h       
                for n=1:h
                    if G(m,n)==1        %判断是否是自由栅格，确定第二个自由栅格
                        %分别计算这两个自由栅格在栅格地图中x方向距离和y方向距离
                        im=abs(i-m);
                        jn=abs(j-n);
                        if im+jn==1||(im==1&&jn==1)
                            %用矩阵D中的部分元素存储栅格地图中两相邻或对角自由栅格在矩阵G中的位置和距离，其他元素值为0
                            %矩阵D的下标分别表示两个自由栅格在矩阵G中的位置，D中元素的值表示两个自由栅格的距离
                            D((i-1)*h+j,(m-1)*h+n)=(im+jn)^0.5;
                        end
                    end
                end
            end
        end
    end
end
end

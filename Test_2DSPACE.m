% syms x y z
% [x,y,z] = solve((x-1)^2+(y-1)^2+(z-1)^2-5);
clear all
dis = [];
a=[2,3];
b=rand(1,2)*10;
save_all = b;
low_line = [0,0];
high_line = [10,10];
n = 1;
% space(n,:) = b;
% space(n+1,:) = a;
save = b(2);
%从减小的方面来生成空间
while b(1)+1>low_line(1)
    while b(2)+1>low_line(2)
        space(n,:) = b;
        n =n+1;
        b(2) = b(2)-2^(1/2);
    end
    b(2) = save;
    n = n+1;
    b(1) = b(1)-2^(1/2);
end
%从增加的方面来生成空间
b=save_all;
while b(1)-11<low_line(1)
    while b(2)-11<low_line(2)
        space(n,:) = b;
        n =n+1;
        b(2) = b(2)+2^(1/2);
    end
    b(2) = save;
    n = n+1;
    b(1) = b(1)+2^(1/2);
end
% space_save=space;
%清除全零行
space(all(space==0,2),:)=[];
%读取生成的空间的行列数
Size = size(space);
L = Size(1);
%计算欧式距离
for i = 1:L;
    euc_dis = EUC_dis(a,space(i,:));
    dis = [dis,euc_dis];
end
%     while b(2)+1>low_line(1)
%         space(n,:) = b;
%         n =n+1;
%         b(2) = b(2)-2^(1/2);
%     end    
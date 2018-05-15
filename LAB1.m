M=mean(magic04); %1.多元均值向量

cov(magic04)
a=repmat( M ,19020, 1);
Z=magic04-a; %中心数据矩阵
C=Z'*Z/19020; %2.内积

e = zeros(10, 10); %定义一个10*10的全0矩阵
for i=1:19020  %用for循环实现矩阵相加
    d=Z(i,:);%中心化矩阵的行向量转置为列向量后再乘以行向量
    e=e+d'*d;
end
C2=e/19020;%3.外积

Z1=Z(:,1);
Z2=Z(:,2);
z2=sqrtm(Z2'*Z2);
z1=sqrtm(Z1'*Z1);
m1=Z1/z1;
m2=Z2/z2;
correlation=m1'*m2;
d=1:19020;
plot(d,magic04(:,1),'.','MarkerSize',5,'Color','r');
hold on;
plot(d,magic04(:,2),'.','MarkerSize',5,'Color','b'); %第四问

c=magic04(:,1)';
u=mean(c); %均值
s=var(c); %方差
xx=min(c):0.1:max(c); 
figure
plot(xx,normpdf(xx,u,s)) ;%第五问

var(magic04);%第六问

data=cov(magic04);
fprintf('协方差最大值为：');
max(max(data));
[x1,y1]=find(data==max(max(data)));
fprintf('在第%d和第%d个属性间',x1,y1);
fprintf('\n');
fprintf('协方差最小值为：');
max(min(data));
[x2,y2]=find(data==min(min(data)));
fprintf('在第%d和第%d个属性间',x2,y2); %第七问


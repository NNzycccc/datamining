M=mean(magic04); %1.��Ԫ��ֵ����

cov(magic04)
a=repmat( M ,19020, 1);
Z=magic04-a; %�������ݾ���
C=Z'*Z/19020; %2.�ڻ�

e = zeros(10, 10); %����һ��10*10��ȫ0����
for i=1:19020  %��forѭ��ʵ�־������
    d=Z(i,:);%���Ļ������������ת��Ϊ���������ٳ���������
    e=e+d'*d;
end
C2=e/19020;%3.���

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
plot(d,magic04(:,2),'.','MarkerSize',5,'Color','b'); %������

c=magic04(:,1)';
u=mean(c); %��ֵ
s=var(c); %����
xx=min(c):0.1:max(c); 
figure
plot(xx,normpdf(xx,u,s)) ;%������

var(magic04);%������

data=cov(magic04);
fprintf('Э�������ֵΪ��');
max(max(data));
[x1,y1]=find(data==max(max(data)));
fprintf('�ڵ�%d�͵�%d�����Լ�',x1,y1);
fprintf('\n');
fprintf('Э������СֵΪ��');
max(min(data));
[x2,y2]=find(data==min(min(data)));
fprintf('�ڵ�%d�͵�%d�����Լ�',x2,y2); %������


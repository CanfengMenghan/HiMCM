x=dlmread('baotongdata.m');  % ���������ļ�baotongdata.m(18x9����)
y=reshape(x,1,162);          % ת��Ϊ����
[n,z]=hist(y),               % Ƶ����
hist(y)                      % ֱ��ͼ
m=mean(y)                    % ��ֵ
s=std(y)                     % ������
h =jbtest(y)                 % ��̬�Լ���
pause
a=0.8;b=1;c=0.75;
q=(b-a)/(b-c);
n=norminv(q,m,s)             % ���գ�2��������ʷֲ�����n


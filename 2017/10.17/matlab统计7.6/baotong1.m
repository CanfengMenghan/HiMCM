x=dlmread('baotongdata.m');  % 读入数据文件baotongdata.m(18x9矩阵)
y=reshape(x,1,162);          % 转换为向量
[n,z]=hist(y),               % 频数表
hist(y)                      % 直方图
m=mean(y)                    % 均值
s=std(y)                     % 均方差
h =jbtest(y)                 % 正态性检验
pause
a=0.8;b=1;c=0.75;
q=(b-a)/(b-c);
n=norminv(q,m,s)             % 按照（2）用逆概率分布计算n


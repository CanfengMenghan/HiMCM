r=[0.3,1.8,2.2,2.5,2.55,2.7];
x=0.1; n=50;
for j=1: 6
    R=r(j);                           % 取R值
for i=1:n
   x(i+1)=x(i)+R*x(i)*(1-x(i));              % 按照（53）迭代计算
end
xx(:,j)=x';
end
k=[0:50]';
[k,xx]
subplot(3,2,1),plot(k,xx(:,1)),gtext('r=0.3'),axis([0,50,0,1.5])    % 在一个图形窗内画6张图，加标题
subplot(3,2,2),plot(k,xx(:,2)),gtext('r=1.8'),axis([0,50,0,1.5]) 
subplot(3,2,3),plot(k,xx(:,3)),gtext('r=2.2'),axis([0,50,0,1.5]) 
subplot(3,2,4),plot(k,xx(:,4)),gtext('r=2.5'),axis([0,50,0,1.5]) 
subplot(3,2,5),plot(k,xx(:,5)),gtext('r=2.55'),axis([0,50,0,1.5]) 
subplot(3,2,6),plot(k,xx(:,6)),gtext('r=2.7'),axis([0,50,0,1.5]) %

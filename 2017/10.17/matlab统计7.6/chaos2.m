n=50;r=2.7;
x=0.1;
for i=1:n
   x(i+1)=x(i)+r*x(i)*(1-x(i));              % 按照（53）迭代计算
end
k=0:50;

y=0.1001;
for i=1:n
   y(i+1)=y(i)+r*y(i)*(1-y(i));              % 按照（53）迭代计算
end
k=0:50;
[k' x' y' ]

subplot(1,2,1),plot(k,x),gtext('x_{0}=0.1'),axis([0,50,0,1.5]) 
subplot(1,2,2),plot(k,y),gtext('x_{0}=0.1001'),axis([0,50,0,1.5]) 

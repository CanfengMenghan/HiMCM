
[m,n]=size(X);
x=X(:,1);
y=X(:,2);
temp=x(1,1);
count=0;
sum=0;
row=0;
for i=1:m
    if x(i)==temp;
        sum=sum+y(i);
        count=count+1;
    else
        row=row+1;
        Y(row,1)=temp;
        Y(row,2)=sum/count;
        count=0;
        sum=y(i);
        count=1;
    temp=x(i);
    end
end
Y(row+1,1)=temp;
Y(row+1,2)=sum/count;
x=Y(:,1);
y=Y(:,2);
y1 = interp1(x,y,a,'pchip') ;
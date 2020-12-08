[m,n]=size(a);
for i=1:m
    B{i}=a(i,:);
end
for i=1:m
    C{i}=zeros(n,n);
    for j=1:n
        for k=1:n
            C{i}(j,k)=B{i}(j)/B{i}(k);
        end
    end
end
egenvector=[];
for i=1:m
t=C{i};
[x,lumda]=eig(t); 
r=abs(sum(lumda)); 
n=find(r==max(r)); 
max_lumda_A(1,i)=lumda(n,n); 
max_x_A{i}=x(:,n); %ÌØÕ÷Öµ
max_x_A{i}=max_x_A{i}./sum(max_x_A{i});
egenvector=[egenvector max_x_A{i}];
end
egenvector=egenvector';
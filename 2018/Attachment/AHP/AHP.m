%clear B
jitiaoshuju=size(A);
jitiaoshuju=jitiaoshuju(1,1);
R=A(:,1);
xingbie=max(R);
R=A(:,2);
jigecanhe=max(R);
%A��ԭʼ����
for b=1:xingbie%�Ա�
B{b}=[];
end
for c=1:jitiaoshuju%��������
for d=1:xingbie%�Ա�
if A(c,1)==d
B{d}=[B{d};A(c,:)];
end
end
end
for e=1:xingbie%�Ա�
for f=1:jigecanhe%�����ͺ�
T=B{e}(:,2);
Q=find(T(T==f));
U(e,f)=max(Q);
end
end
%U��ԭʼ����������ڶ��е�һ�о���Ů�Ĳͺ�ѡ��Ϊ1���ж��ٸ���
for l=1:xingbie%�м����Ա�
for j=1:jigecanhe%�м����ͺ�
for k=1:jigecanhe%�м����ͺ�
C{l}(j,k)=U(l,j)/U(l,k);
end
end
end
for i=1:xingbie%�м����Ա�
t=C{i};
[x,lumda]=eig(t); 
r=abs(sum(lumda)); 
n=find(r==max(r)); 
max_lumda_A(1,i)=lumda(n,n); 
max_x_A{i}=x(:,n); %����ֵ
max_x_A{i}=max_x_A{i}./sum(max_x_A{i});
end
for p=1:xingbie%�м����Ա�
for q=1:jigecanhe%�м����ͺ�
max_x_AB(p,q)=max_x_A{p}(q,1);%������������һ�����еĵĸ���Ȩ�أ��ڶ�����Ů�ĵĸ���Ȩ��
end
end
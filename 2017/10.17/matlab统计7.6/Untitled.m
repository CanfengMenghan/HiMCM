x=[0.02 0.06 0.11 0.22 0.56 1.1];
x1=[0.02 0.06 0.11 0.22 0.56];
y1=[76 97 123 159 191 207];
y2=[47 107 139 152 201 200];
z1=[67 84 98 131 144 160];
z2=[51 86 115 124 158];
 plot(x,y1,'bo',x,y2,'bo');
 plot(x,z1,'bo',x1,z2,'bo');
  X=1./x;
   Y=1./y1
    [b,bint,r,rint,s]=regress(Y',X1)
    
    function  y=f1(beta, x)
y=beta(1)*x./(beta(2)+x);

beta0=[195.8027  0.04841];
[beta,R,J]=nlinfit(x,y,¡¯f1¡¯,beta0);
betaci=nlparci(beta,R,J);
beta, betaci 

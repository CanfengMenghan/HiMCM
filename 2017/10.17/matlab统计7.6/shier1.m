ts=0:0.1:15;                              
x0=[25,2];
[t,x]=ode45(@shier,ts,x0);
[t,x]
plot(t,x),grid,
gtext('\fontsize{12}x(t)'),gtext('\fontsize{12}y(t)'), pause,
plot(x(:,1),x(:,2)),grid,
xlabel('\fontsize{12}x'),ylabel('\fontsize{12}y')

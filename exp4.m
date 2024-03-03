R=3000;
C=0.32e-3;
L=8;
eps=(R/2)*(sqrt(C/L));
w=1/sqrt(L*C);
N=w^2;
D=[1 2*eps*w w^2];
printsys(N,D);
t=0:1:10;
y1=step(N,D,t);
y2=4*y1;
plot(t,y2,'r');
grid;

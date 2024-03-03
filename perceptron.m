function [w1,w2]=perceptron()
w1=0.3;
w2=0.1;
taux=0.1;
b=0.2;
e1=[0 0 1 1];
e2=[0 1 0 1];
yd=[0 0 0 1];
k=1;
for i=1:20
   if(k==5)
        k=1;
   end
   S=w1*e1(k)+w2*e2(k);
    if(S<=b)
        yc=0;
    else
        yc=1;
    end
    if(yd(k)~=yc)
        fprintf("Ajustement des poids \n");
        w1=w1+taux*e1(k)*(yd(k)-yc);
        w2=w2+taux*e2(k)*(yd(k)-yc);
        fprintf("w1=%0.1f w2=%0.1f yc=%d iteration %d\n",w1,w2,yc,i);
    end 
    k=k+1;
end
while(1)
    x1=input('x1=');
    x2=input('x2=');
    S=w1*x1+x2*w2;
    if(S<=b)
        y=0;
    else
        y=1;
    end
    fprintf('%d AND %d is %d \n',x1,x2,y);
end
end
    

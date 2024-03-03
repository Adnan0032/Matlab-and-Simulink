%% First practice 
function av=average(A)
A=[1 2 3];
B=[1 2 3 ; 4 5 6 ; 6 7 8];
if ndims(B)>2
    error('The dimension of the input cannot exceed 2');
end
av=sum(B(:)/length(B(:)));

%% Second practice
count=0;
for k=0:0.1:1
count=count+1;
end
%% third
Z=peaks;
plot(Z)
%% fourth
t=0:(pi/20):(2*pi);
y=exp(sin(t));
plotyy(t,y,t,y,'plot','ste')
%% five

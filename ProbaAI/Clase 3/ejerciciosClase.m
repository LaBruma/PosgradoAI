state = 1;

rand(state,100);
T=1; N=500; dt=T/N;
dW=zeros(1,N);
W=zeros(1,N);

dW(1)=sqrt(dt)*randn;
W(1)=dW(1);
for j=2:N
  dW(j)=sqrt(dt)*randn;
  W(j)=W(j-1)+dW(j);
endfor

plot([0:dt:T],[0,W],'r');
xlabel('t')
ylabel('W(t)')

# Variables aleatorias enteras
#=============================
randi(6);
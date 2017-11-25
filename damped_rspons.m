function  amplitude  = damped_rspons( mck )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
global  m0   m1 m2 c0  c1 c2 k0 k1  k2 omiga F0;
mtotal=20;
m0=100;
m1=mck(1);
m2=mtotal-mck(1);
c0=400;
c1=mck(2);
c2=mck(3);
k0=8000;
k1=mck(4);
k2=mck(5);
omiga=50;
F0=500;

if(m1<0|m2<0|c1<0|c2<0|k1<0|k2<0)
    amplitude=inf;
else

tspan=[0:0.01:50];
y0=[0;0;0;0;0;0];
[t,y]=ode23('dyfunc',tspan,y0);
a=y(4000:5000,1);
amplitude=max(a);
end
subplot(311);
plot(t,y(:,1));
xlabel('t');
ylabel('x(t)m0');
subplot(312);
plot(t,y(:,2));
xlabel('t');
ylabel('x(t)m1');
subplot(313);
plot(t,y(:,3));
xlabel('t');
ylabel('x(t)m3');


end


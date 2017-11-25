function dy = dyfunc(t,y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global  m0   m1 m2 c0  c1 c2 k0 k1  k2 omiga F0;
dy=zeros(6,1);
dy(1)=y(2);
dy(2)=1/m0*(F0*cos(omiga*t)-(c0+c1+c2)*y(2)+c1*y(4)+c2*y(6)-(k0+k1+k2)*y(1)+k1*y(3)+k2*y(5));
dy(3)=y(4);
dy(4)=1/m1*(c1*y(2)-c1*y(4)+k1*y(1)-k1*y(3));
dy(5)=y(6);
dy(6)=1/m2*(c2*y(2)-c2*y(6)+k2*y(1)-k2*y(5));

end


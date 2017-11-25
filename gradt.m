function [ grd ] =gradt( fun,xx)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
nvars=max(size(xx));
f=str2func(fun);
grd=zeros(nvars,1);
step=0.00001;
for i=1:nvars
    xxfwd=xx;
    xxbcd=xx;
    xxfwd(i)=xxfwd(i)+step;
    xxbcd(i)=xxbcd(i)-step;
    grd(i)=(f(xxfwd)-f(xxbcd))/(2*step);
end


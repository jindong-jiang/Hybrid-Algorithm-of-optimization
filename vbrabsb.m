function [ zhenfubi ] = vbrabsb( INPUTi,lamda ,miu)
%please input the gama and kesi, remember that input the kesi when gama input is completely finished  

%lamda加振频率比
INPUT=reshape(INPUTi,numel(INPUTi)/2,2);
a=size(INPUT,1);%a 为阻尼吸振器级数
miuni=miu/a;%miu为n重动力吸振器zhong质量比,单个吸振器质量比要除以n(miu为mius，单一动力吸振器的质量比)
gama=INPUT(:,1);%第i个动力吸振器的固有频率比
kesi=INPUT(:,2);%第i个动力吸振器的阻尼比


ww1=miuni.*lamda.^2;
ww2=2.*lamda.*kesi./gama;
ww3=1.-(lamda.^2)./(gama.^2);
aa=ww1.*(ww3+ww2.^2)./(ww3.^2.+ww2.^2);
bb=ww1.*ww2./(ww3.^2+ww2.^2);
A=(1-lamda.^2)-sum(aa);
B=sum(bb);
zhenfubi=1/(A^2+B^2)^0.5;


end


function [ zhenfubi ] = tmdserie( INPUTi,lamda ,miu)
%please input the gama and kesi, remember that input the kesi when gama input is completely finished  

%lamda加振频率比
INPUTi=reshape(INPUTi,1,numel(INPUTi));%Anyway,I hope the matrix in is a row vector;
INPUT=[INPUTi(1:(end+1)/3-1)  miu-sum(INPUTi(1:(end+1)/3-1)),INPUTi((end+1)/3:end)];
INPUT=reshape(INPUT,numel(INPUT)/3,3);
a=size(INPUT,1);%a 为阻尼吸振器级数
miuni=INPUT(:,1);%miu为n重动力吸振器zhong质量比,单个吸振器质量比要除以n(miu为mius，单一动力吸振器的质量比)
gama=INPUT(:,2);%第i个动力吸振器的固有频率比
kesi=INPUT(:,3);%第i个动力吸振器的阻尼比
kesizhu=0;%主系统的振动阻尼比
 
%***************generate the mass matrix m ************************
m=zeros(a+1,a+1);
m(1,1)=1;
for i=2:a+1
    m(i,i)=miuni(i-1);
end 
%******************************************************************

%***************generate the damp matrix c ************************
c=zeros(a+1,a+1);
for i=2:a
    c(i-1,i)=-miuni(i-1)*gama(i-1)*kesi(i-1);
    c(i,i-1)=c(i-1,i);
    c(i,i)=miuni(i-1)*gama(i-1)*kesi(i-1)+miuni(i)*gama(i)*kesi(i);
end
c(1,1)=kesizhu+kesi(1)*gama(1)*miuni(1);
c(a+1,a)=-miuni(a)*gama(a)*kesi(a);
c(a,a+1)=c(a+1,a);
c(a+1,a+1)=miuni(a)*gama(a)*kesi(a);

%******************************************************************

%***************generate the stiffness matrix k *******************
k=zeros(a+1,a+1);
for i=2:a
    k(i-1,i)=-miuni(i-1)*gama(i-1)^2;
    k(i,i-1)=k(i-1,i);
    k(i,i)= miuni(i-1)*gama(i-1)^2+miuni(i)*gama(i)^2;
end
k(1,1)=1+miuni(1)*gama(1)^2;
k(a+1,a)=-miuni(a)*gama(a)^2;
k(a,a+1)=k(a+1,a);
k(a+1,a+1)=miuni(a)*gama(a)^2;
%******************************************************************

%***************Now,it's time to caculate**************************

AA=-lamda^2*m+1i*lamda*2*c+k;
xx=AA\[1 zeros(1,a)]';
zhenfubi=abs(xx(1));





end



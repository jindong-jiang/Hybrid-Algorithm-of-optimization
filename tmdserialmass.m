function [ zhenfubi ] =tmdserialmass( a ,lamda,miu)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
sz=numel(a)/2;%动力吸振器级数
miuni=miu/sz;
insertlocat=1:3:3*sz-3;%插入质量变量的位置

gamakesimiu=-ones(1,3*sz-1);
gamakesimiu(insertlocat)=miuni*ones(1,sz-1);
gamakesimiu(gamakesimiu<0)=a;


[ zhenfubi ] = tmdserie( gamakesimiu,lamda ,miu);

end


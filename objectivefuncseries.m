function [ J] = objectivefuncseries( gamakesi )
%UNTITLED Summary of this function goes here

%objectivefunc([0.8505 0.9940 0.1280 0.1628])
%objectivefunc([0.7984 0.8785 0.9679  1.0910 0.0731 0.0814 0.0882 0.0939])
%   Detailed explanation goes
%   here%IIIIIIIIIII!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!去除小于0的解
for i=1:numel(gamakesi)
    if gamakesi(i)<=0||sum(gamakesi(1:(end+1)/3-1))>=0.1||gamakesi(i)>=1.5
        J=inf;
        return;
    end
end
regionstep=[0  0.01 1.9];
x=regionstep(1):regionstep(2):regionstep(3);
y=zeros(1,numel(x))';
for i=1:numel(x)
    y(i)=tmdserie(gamakesi,x(i),0.1);%Consider the situation where each mass is different;
%      y(i)=tmdserialmass(gamakesi,x(i),0.1);%Suppose all the mass are the same
end
pp=spline(x,y);
% plot(x,y,'+')
% hold on
% fnplt(pp);
% hold on
% xlabel('频率比')
% ylabel('振幅比')

J = -fnmin(fncmb(pp,-1));%选取最大值作为优化函数
return;
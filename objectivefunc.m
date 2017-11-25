function [ J] = objectivefunc( gamakesi )
%UNTITLED Summary of this function goes here

%objectivefunc([0.8505 0.9940 0.1280 0.1628])
%objectivefunc([0.7984 0.8785 0.9679  1.0910 0.0731 0.0814 0.0882 0.0939])
%   Detailed explanation goes
%   here%IIIIIIIIIII!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!去除小于0的解
for i=1:numel(gamakesi)
    if gamakesi(i)<=0||gamakesi(i)>=1.5
        J=inf;
        return;
    end
end
regionstep=[0  0.01 1.9];
x=regionstep(1):regionstep(2):regionstep(3);
y=zeros(1,numel(x))';
for i=1:numel(x)
    y(i)=tmd(gamakesi,x(i),0.1);
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
% 
% dpp=fnder(pp);
% Z=fnzeros(dpp,[0.6,1.4]);
% 
% %************判断第一个极值点点是否为极大值********************
% ddpp=fnder(dpp);
% if ppval(ddpp,Z(1))>=0
%     J=inf;
%     return;
% end           %有时会出现拐点，“这是不应该被允许的！！！”
% %*******************************************************
% % j=1;%有时候真是遗憾，写了许多程序，却发现完全没必要，
% % 只需MATLAB一行即可，故将MATLAB当C用是不理智的
% % for i=1:2:size(Z,2)
% %     j=j+1;取出奇数行
% %     Px(j)=Z(1,i);
% % end
% Px=Z(1,1:2:end);
% 
% %********************判断极大值点的个数*****************
% % if (numel(Px)~=(1+0.5*numel(gamakesi)))
% %     J=((numel(Px)-1-0.5*numel(gamakesi)))^2+9;
% %     return;
% % end
% %****************************************************
% 
% P=ppval(pp,Px);
% %I=sum((sum(P)/numel(P)-P).^2);
% J=sum(P)/numel(P);

end


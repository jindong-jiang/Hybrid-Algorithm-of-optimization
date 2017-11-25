function [ output_args ] = rspons( input_args )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

i=0;
regionstep=[0  0.01 1.9];

%--------------------------一重--------------------------------------------
for x=regionstep(1):regionstep(2):regionstep(3)
    i=i+1;
    y(i)=tmd([0.9113 0.16359 ],x,0.1);

end
x=regionstep(1):regionstep(2):regionstep(3);
plot(x,y,'-')
hold on
% pp=spline(x,y);
% fnplt(pp);
% hold on
% J = -fnmin(fncmb(pp,-1))
%--------------------------二重-------------------------------------------
i=0;
for x=regionstep(1):regionstep(2):regionstep(3)
    i=i+1;
    y(i)=tmd([  0.8424    1.0074    0.1158    0.1343],x,0.1);

end
x=regionstep(1):regionstep(2):regionstep(3);
plot(x,y,'g.')
hold on
% pp=spline(x,y);
% fnplt(pp);
% hold on
% J = -fnmin(fncmb(pp,-1))
%---------------------------四重------------------------------------------
i=0;
for x=regionstep(1):regionstep(2):regionstep(3)
    i=i+1;
    y(i)=tmd([0.9672    0.8709    0.7948    1.0868    0.0866    0.0817    0.0839    0.0964],x,0.1);

end
x=regionstep(1):regionstep(2):regionstep(3);
plot(x,y,'r*')
hold on
% pp=spline(x,y);
% fnplt(pp);
% hold on
% J = -fnmin(fncmb(pp,-1))
%-----------------------------六重-----------------------------------------

% i=0;
% for x=regionstep(1):regionstep(2):regionstep(3)
%     i=i+1;
%     y(i)=tmd([0.8346    0.9141    0.7883    0.9123    1.1187    1.0151    0.0802    0.1036    0.0701    0.0828    0.0836    0.0740],x,0.1);
% 
% end
% x=regionstep(1):regionstep(2):regionstep(3);
% plot(x,y,'k+')
% hold on
%样条曲线
% pp=spline(x,y);
% fnplt(pp);
% hold on
% J = -fnmin(fncmb(pp,-1))
i=0;
for x=regionstep(1):regionstep(2):regionstep(3)
    i=i+1;
    y(i)=tmd([0.7752 0.8327 0.8912 0.9554 1.0336 1.13228 0.05252 0.05773 0.05899 0.0635 0.0656 0.063299],x,0.1);

end
x=regionstep(1):regionstep(2):regionstep(3);
plot(x,y,'k+')
hold on

%---------------------------八重-------------------------------------------

% i=0;
% for x=regionstep(1):regionstep(2):regionstep(3)
%     i=i+1;
%     y(i)=tmd([ 0.7978    0.8904    1.1098    0.8833    1.0337    0.9769    0.9201 0.8054    0.0634    0.1195    0.0886    0.0906    0.0924    0.1022 0.1062    0.0848],x,0.1);
% 
% end
% x=regionstep(1):regionstep(2):regionstep(3);
% plot(x,y,'yh')
% hold on
% pp=spline(x,y);
% fnplt(pp);
% hold on
% J = -fnmin(fncmb(pp,-1))


%--------------------------- Without TMD -----------------------------------------

i=0;
for x=regionstep(1):regionstep(2):regionstep(3)
    i=i+1;
    y(i)=tmd([0,0],x,0.1);

end
x=regionstep(1):regionstep(2):regionstep(3);
plot(x,y,'co')
hold on
% pp=spline(x,y);
% fnplt(pp);
% hold on
% J = -fnmin(fncmb(pp,-1))

axis([0,2,0,7])
legend('一重','二重','四重','六重','原系统')
xlabel('频率比')
ylabel('振幅比')
end

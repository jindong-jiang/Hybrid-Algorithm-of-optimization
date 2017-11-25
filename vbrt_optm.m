function [xbest,fbest ] = vbrt_optm(fun,nvars)
err=10^-5;
xopt=0.5;
xopt=xopt*(ones(1,nvars));
i=0;
fbest=10;%This one is only a initiate one,no sense

% xopt=[0.025 0.025 0.025 0.9   0.9  0.9 0.9 0.1  0.1 0.1 0.1];
% xopt=[0.05 0.9  0.9 0.1 0.1 ];


while(1)
% xoptinterval=[xopt(1)-0.0049  xopt(2)-0.0049 xopt(3)-0.0049 xopt(4)-0.049 xopt(5)-0.049 xopt(6)-0.049 xopt(7)-0.049 xopt(8)-0.049 xopt(9)-0.049 xopt(10)-0.049 xopt(11)-0.049; ...
%                xopt(1)+0.0049  xopt(2)+0.0049 xopt(3)+0.0049 xopt(4)+0.049 xopt(5)+0.049 xopt(6)+0.049 xopt(7)+0.049 xopt(8)+0.049 xopt(9)+0.049 xopt(10)+0.049 xopt(11)+0.049];
%   xoptinterval=[xopt(1)-0.0049  xopt(2)-0.049 xopt(3)-0.049  xopt(4)-0.049 xopt(5)-0.049 ; ...
%                 xopt(1)+0.0049  xopt(2)+0.049 xopt(3)+0.049  xopt(4)+0.049 xopt(5)+0.049 ];
xoptinterval=[xopt/1.1;xopt*1.1];
options=gaoptimset('PopulationSize',130,'CrossoverFraction',0.9,'MigrationFraction',0.5,'Generations',500,'StallGenLimit',50,'PlotFcns',@gaplotbestf,'PopInitRange',xoptinterval);
eval(['[x0,f0]=ga(@',fun,',',num2str(nvars),',options);'])


opt=optimset('PlotFcns',@optimplotfval,'TolFun',1e-10,'TolX',1e-10);
eval(['[xopt,fopt]=fminunc(@',fun, ',x0 ,opt);'])

%xopt=xopt';
 i=i+1;%find out how many steps to get the optimal point
 
 
if(fopt<fbest)
    fbest=fopt;
    xbest=xopt;
end
 
if(i>=15)    
   disp('The cycle index is')
    i
    break;
   
end 
% [x0,f0]=ga(@test,nvars,options)
% [x1,f1]=fminunc(@test, x0 )
end
end


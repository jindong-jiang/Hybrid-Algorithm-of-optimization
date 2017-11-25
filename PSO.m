function [xm,fv] = PSO(fitness,N,c1,c2,w,M,D,xopt)

format long;
%epsilon=0.0000000000000001;
%------初始化种群的个体------------
%xopt为初始化变量均值
for i=1:N

    for j=1:D

        x(i,j)=randn+xopt;  %随机初始化位置

        v(i,j)=randn;  %随机初始化速度

    end

end

%------先计算各个粒子的适应度，并初始化Pi和Pg----------------------

for i=1:N

    p(i)=fitness(x(i,:));

    y(i,:)=x(i,:);

end

pg = x(N,:);             %Pg为全局最优

for i=1:(N-1)

    if fitness(x(i,:))<fitness(pg)

        pg=x(i,:);

    end

end

%------进入主要循环，按照公式依次迭代------------
dd=0;
 figure;


for t=1:M
    dd=dd+1;
    for i=1:N

        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));

        x(i,:)=x(i,:)+v(i,:);

        if fitness(x(i,:))<p(i)

            p(i)=fitness(x(i,:));

            y(i,:)=x(i,:);

        end

        if p(i)<fitness(pg)

            pg=y(i,:);

        end
        

    end
     
    Pbest(t)=fitness(pg);
     
    plot(dd,Pbest(t),'*');
    xlabel('迭代次数');
     ylabel('当前优化观测值'); 
    drawnow;
    hold on
    
%     if   t-1~=0 &&abs(Pbest(t-1)-Pbest(t))<=epsilon
%         break;
%     end
end
xm = pg';
fv = fitness(pg);




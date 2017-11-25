function [ output_args ] =plot_rosenbrock( input_args )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
clf;
x=-5:0.5:5;
y=x;
[X,Y]=meshgrid(x,y);
[a,b]=size(x);
[c,d]=size(y);
for j=1:b
    for i=1:d
        Z(i,j)=rosenbrock([x(j),y(i)]);
        
    end
end
surf(X,Y,Z)

end


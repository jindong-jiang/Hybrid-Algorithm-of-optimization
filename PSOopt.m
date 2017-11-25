function [ x0,f0 ] =PSOopt( fname ,nvars)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
F=str2func(fname);
xopt=8;
[x0,f0]=PSO(F,40,0.7,1,1,10000,nvars,xopt);

end


function [ f ] = rosenbrocksym( a,b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
syms a b;
f=(1-a)^2+100*(b-a^2)^2;

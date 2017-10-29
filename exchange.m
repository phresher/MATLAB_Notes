function [a,b] = exchange(a,b);
%exchange the value of a,b
a=a+b;
b=a-b;
a=a-b;

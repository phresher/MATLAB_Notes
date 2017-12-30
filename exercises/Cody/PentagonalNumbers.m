% https://cn.mathworks.com/matlabcentral/cody/problems/44360-pentagonal-numbers
% Your function will receive a lower and upper bound.
% It should return all pentagonal numbers within that
% inclusive range in ascending order. Additionally,
% it should return an array that indicates those numbers
% that are divisible by 5. For example,
%
%  [p,d] = pentagonal_numbers(10,40)
% should return
%
%  p = [12,22,35]
%  d = [ 0, 0, 1]
%%
x1 = 1; x2 = 25;
[p,d] = pentagonal_numbers(x1,x2);
assert(isequal(p,[1,5,12,22]))
assert(isequal(d,[0,1,0,0]))
%%
function [p,d] = pentagonal_numbers(lowerBound,upperBound)
p = [];
for i = lowerBound:upperBound
    num = double(i);
    flag1 = (sqrt(24*num+1) - fix(sqrt(24*num+1))) == 0;
    if ~flag1
        continue;
    end
    flag2 = mod(sqrt(24*num+1)+1,6) == 0;
    if ~flag2
        continue;
    end
    p = [p, int32(num)];
end
d = mod(p, 5);
d = logical(d);
d = ~d;
end
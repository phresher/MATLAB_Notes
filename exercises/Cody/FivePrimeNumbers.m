% https://cn.mathworks.com/matlabcentral/cody/problems/44305-5-prime-numbers
% Your function will be given lower and upper integer bounds. Your task is 
% to return a vector containing the first five prime numbers in that range 
% that contain the number five. But, if you can't find at least five such 
% numbers, the function should give up and return -1.
%%
n_min = 60;
n_max = 1000;
y_correct = [151,157,251,257,353];
assert(isequal(five_primes(n_min,n_max),y_correct))
%%
function y = five_primes(n_min,n_max)
p = primes(n_max);
p = p(p>=n_min);
y = nan(1,5);
yNum = 1;
for i=1:length(p)
    pStr = num2str(p(i));
    flag = pStr(pStr == '5');
    if isempty(flag)
        continue
    else
        y(yNum) = p(i);
        if yNum == 5
            return
        end
        yNum = yNum + 1;
    end
end
y = -1;
end
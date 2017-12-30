% https://cn.mathworks.com/matlabcentral/cody/problems/2736
% Since Cody is 5 years old, it's pernicious. A Pernicious number is an 
% integer whose population count is a prime. Check if the given number is pernicious.
%%
x = 5;
y_correct = true;
assert(isequal(isPernicious(x),y_correct))
%%
x = 17;
y_correct = true;
assert(isequal(isPernicious(x),y_correct))
%%
function y = isPernicious(x)
    bin = dec2bin(x);
    bin(bin=='1')=1;
    bin(bin=='0')=0;
    binSum = sum(bin);
    y = isprime(binSum);
end
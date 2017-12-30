% https://cn.mathworks.com/matlabcentral/cody/problems/44385-extra-safe-primes
% Did you know that the number 5 is the first safe prime? A safe prime is 
% a prime number that can be expressed as 2p+1, where p is also a prime.

% To celebrate Cody's Five-Year Anniversary, write a function to determine 
% if a positive integer n is a safe prime in which the prime p 
% (such that n=2p+1) is also a safe prime.
%%
x = 0;
assert(isequal(isextrasafe(x),false))
%%
x = 5;
assert(isequal(isextrasafe(x),false))
%%
function tf = isextrasafe(x)
    if ~isprime(x)
        tf = false;
        return
    end
    [p, tf] = issafe(x);
    if ~tf
        return
    end
    [~, tf] = issafe(p);
end

function [p, tf] = issafe(x)
    tf = false;
    pSet = primes(x);
    for p = pSet
        if 2*p+1 == x
            tf = true;
            return
        end
    end
end
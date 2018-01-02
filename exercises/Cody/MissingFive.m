assert(isequal(regexprep(char(string(dec2missing5(3))),'^0*',''),'3'))
assert(isequal(regexprep(char(string(dec2missing5(9541))),'^0*',''),'14081'))
function y = dec2missing5(x)
y = [];
while true
    remainder = rem(x, 9);
    remainder(remainder>=5)=remainder+1;
    y = [num2str(remainder) y];
    x = fix(x/9);
    if x == 0
        break
    end
end
end
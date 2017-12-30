%%
n = 5;
assert(isequal(is_it_really_a_5(n),1))

%%
n = 15;
assert(isequal(is_it_really_a_5(n),0))
%%
function tf = is_it_really_a_5(n)
tf = 0;
n = num2str(n);
lengthN = length(n);
bit = mod(lengthN,3);
group = fix(lengthN/3);
switch bit
    case 1
        if n(1) == '5'
            tf = 1;
            return
        end
    case 2
        if n(1) ~= '1' && n(2) == '5'
            tf = 1;
            return
        end
    case 0
        if (n(1) == '5') || (n(2) ~= '1' && n(3) == '5')
            tf = 1;
            return
        end
end
if group > 0
    for i=1:group
        if (n(bit-2+3*group) == '5') || (n(bit-1+3*group) ~= '1' && n(bit+3*group) == '5')
            tf = 1;
            return
        end
    end
end
end
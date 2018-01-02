%% https://cn.mathworks.com/matlabcentral/cody/problems/44339-recaman-sequence-ii
%%
x = 0;
y_correct = 2;
assert(isequal(RecamanII(x),y_correct))
%%
x = 90;
y_correct = 35;
assert(isequal(RecamanII(x),y_correct))
%%
x = 123456789;
y_correct = 46633;
assert(isequal(RecamanII(x),y_correct))
%%
function y = RecamanII(startPoint)
n = 1;
hist(1) = startPoint;
while true
    n = n + 1;
    B=hist(n-1)-(n-1);
    C=0.^( abs(B+1) + (B+1) );
    D=ismember(B, hist(1:n-1));
    hist(n)=hist(n-1)+ (n-1) * (-1)^(C + D -1);
    if hist(n) == 1
        y = n;
        return
    end
end
end
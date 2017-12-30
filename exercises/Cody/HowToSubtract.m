% https://cn.mathworks.com/matlabcentral/cody/problems/564-how-to-subtract
% ¡À ¡À ¡À ¡À ¡À ¡À ¡À ¡À ¡À ¡À ¡À
% 
% Imagine you need to subtract one number from another using MATLAB.
% You will not be using eval for this task.
% Given two ASCII strings representing two integers X and Y.
% Each of them has only 12 or less ASCII characters.
% Each of them represents signed integers, such as '+2345'
% Please output the result of (X-Y) in a similar style.
%%
X='+68768686834554';
Y='+76574535435398';
Z_correct='-7805848600844';
assert(isequal(mysub(X,Y),Z_correct))
%%
X='+1';
Y='+2';
Z_correct ='-1';
assert(isequal(mysub(X,Y),Z_correct))
	
%%
X='+100';
Y='+20';
Z_correct ='+80';
assert(isequal(mysub(X,Y),Z_correct))
%%
function Z = mysub(X,Y)
    xSign = X(1);
    xAbs = int64(str2double(X(2:end)));
    if strcmp(xSign, '-')
        xVal = -xAbs;
    else
        xVal = xAbs;
    end
    ySign = Y(1);
    yAbs = int64(str2double(Y(2:end)));
    if strcmp(ySign, '-')
        yVal = -yAbs;
    else
        yVal = yAbs;
    end
    zVal = xVal - yVal;
    if zVal < 0
        Z = sprintf('%d', zVal);
    else
        Z = sprintf('+%d', zVal);
    end
    disp(Z);
end
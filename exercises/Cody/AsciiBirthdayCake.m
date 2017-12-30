% https://cn.mathworks.com/matlabcentral/cody/problems/44380-ascii-birthday-cake
% Given an age and a name, give draw an ASCII birthday cake. For example, 
% given the name "CODY" and the age 5, return a string with the following (no trailing spaces)
% 
%    6 6 6 6 6
%    | | | | |
%  __|_|_|_|_|__
% {             }
% {             }
% {    CODY     }
% {             }
% {_____________}
% This uses the string datatype, not a char array.
%%
cake = string(char([32 32 32 54 32 54 32 54 32 54 32 54 10 32 32 32 124 ...
    32 124 32 124 32 124 32 124 10 32 95 95 124 95 124 95 124 95 124 95 ...
    124 95 95 10 123 32 32 32 32 32 32 32 32 32 32 32 32 32 125 10 123 ...
    32 32 32 32 32 32 32 32 32 32 32 32 32 125 10 123 32 32 32 32 67 79 ...
    68 89 32 32 32 32 32 125 10 123 32 32 32 32 32 32 32 32 32 32 32 32 ...
    32 125 10 123 95 95 95 95 95 95 95 95 95 95 95 95 95 125 10]));
fprintf('%s\n', cake);
assert(isequal(birthday_cake("CODY", 5), cake));
%%
function s = birthday_cake(name, n)
name = char(name);
width = 2*n+5;
nameWidth = length(name);
s1 = blanks(width-3);
s2 = blanks(width-3);
s3 = blanks(width-1);
s4 = blanks(width);
s4(1) = '{'; s4(end) = '}';
s5 = s4;
s6 = s5;
s6(fix(width/2-nameWidth/2)+1:fix(width/2-nameWidth/2)+nameWidth) = name;
s7 = s5;
s8 = s7;
s8(s8==' ') = '_';
for i=1:n
    s1(2+2*i)='6';
    s2(2+2*i)='|';
    s3(2+2*i)='|';
end
s3(s3==' ') = '_';
s3(1) = ' ';
s = [s1, 10, ...
    s2, 10, ...
    s3, 10, ...
    s4, 10, ...
    s5, 10, ...
    s6, 10, ...
    s7, 10, ...
    s8, 10];
fprintf('%s\n', s);
s = string(s);
end
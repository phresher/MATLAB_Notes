function tf = isLeapYear(year)
% Determine if input is a leap year.

if (year - fix(year) ~= 0) || (year <= 0)
    error('illegal input.');
end

if ((mod(year, 4) == 0) && (mod(year, 100) ~= 0)) || (mod(year, 400) == 0)
    tf = 1;
else
    tf = 0;
end
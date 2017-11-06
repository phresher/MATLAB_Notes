count = 0;
for years = 1840:2050
    if isLeapYear(years)
        disp(years)
        count = count + 1;
    end
end
disp(count)
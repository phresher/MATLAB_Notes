c = 5;
y_correct = [2 11; 5 10];
y = sumoftwosquares(c);
assert(isequal(y,y_correct))
function y = sumoftwosquares(c)
    cubic = c^3;
    y = [];
    first = 0;
    while true
        first = first + 1;
        second = 0;
        while true
            second = second + 1;
            squareSum = first^2 + second^2;
            if abs(squareSum - cubic) < 0.1
                y = [y;first second];
                break;
            elseif squareSum > cubic
                break
            end
        end
        if  first > second
            break
        end
    end
    disp(y);
end
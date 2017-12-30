	
%%
x = [1 1 1
     0 0 0
     0 0 0];
y_correct = 1;
assert(isequal(your_fcn_name(x),y_correct))
%%
function flagWin = your_fcn_name(M)
  flagWin = false;
  sum1 = abs(sum(M,1));
  sum1 = sum1(sum1==3);
  if ~isempty(sum1)
      flagWin = true;
      return
  end
  sum2 = abs(sum(M,2));
  sum2 = sum2(sum2==3);
  if ~isempty(sum2)
      flagWin = true;
      return
  end
  sum3 = abs([M(1,1)+M(2,2)+M(3,3) ...
      M(1,3)+M(2,2)+M(3,1)]);
  sum3 = sum3(sum3==3);
  if ~isempty(sum3)
      flagWin = true;
      return
  end
end
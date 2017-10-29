function B = mySort(A, method)
switch method
    case 'insert'
        L=length(A);
        B=A;
        for i=2:L
            for j=i-1:-1:1
                if B(i)<B(j)
                    trans=B(j);
                    B(j)=B(i);
                    B(i)=trans;
                    i=j;
                else
                    break
                end
                
            end
            
        end
    case 'selection sort'
        B = A;
        L = length(A);
        for i=1:L
            B(i)=A(i);
            for j=i+1:L
                if B(i) < A(j);
                     m = B(i);
                     B(i)= A(j);
                     A(j)=m;
                end
            end
        end
        
    % heap isn't finished    
    case 'heap sort'
        B=A;
        l=length(A);
        l=floor((l-1)/2);
        for i=1:l
            j=2*i;
            k=j+1;
            if B(i)>B(j)
                exchange(B(i),B(j))
            end
            if B(i)>B(k)
                exchange(B(i),B(k))
            end
        end
    case 'sort'
        B = sort(A);
end

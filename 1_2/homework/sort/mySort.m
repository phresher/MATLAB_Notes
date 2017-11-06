function A = mySort(A, algorithm)
% Practice several sort algorithms in one function.

L=length(A);
switch algorithm
    
    % insert sort
    case 'insert'
        for i=2:L
            for j=i:-1:2
                if A(j)<A(j-1)
                    [A(j), A(j-1)] = swap(A(j), A(j-1));
                else
                    break
                end
            end
        end
        
    % selection sort
    case 'selection'
        for i=1:L
            for j=i+1:L
                if A(i) > A(j)
                    [A(i), A(j)] = swap(A(i), A(j));
                end
            end
        end
        
    % heap sort
    case 'heap'
        % Build max-heap from x
        A = buildmaxheap(A,L);
        
        % Heapsort
        heapsize = L;
        for i = L:-1:2
            % Put (n + 1 - i)th largest element in place
            [A(1), A(i)] = swap(A(1), A(i));
            
            % Max-heapify x(1:heapsize)
            heapsize = heapsize - 1;
            A = maxheapify(A,1,heapsize);
        end
end
end

function A = buildmaxheap(A,L)
% Build max-heap out of x
% Note: In practice, x xhould be passed by reference

for i = floor(L / 2):-1:1
    % Put children of x(i) in max-heap order
    A = maxheapify(A,i,L);
end

end

function A = maxheapify(A,i,heapsize)
% Put children of x(i) in max-heap order
% Note: In practice, x xhould be passed by reference

% Compute left/right children indices
ll = 2 * i; % Note: In practice, use left bit shift
rr = ll + 1; % Note: In practice, use left bit shift, then add 1 to LSB

% Max-heapify
if ((ll <= heapsize) && (A(ll) > A(i)))
    largest = ll;
else
    largest = i;
end
if ((rr <= heapsize) && (A(rr) > A(largest)))
    largest = rr;
end
if (largest ~= i)
    [A(i), A(largest)] = swap(A(i), A(largest));
    A = maxheapify(A,largest,heapsize);
end

end

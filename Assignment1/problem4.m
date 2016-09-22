arr = [ 7 4 4 2; 6 8 5 2; 4 7 1 3; 6 5 2 1; ];
best_so_far = 0;
best_assignment = [];

for i = 1:4
    for j = 1:4
        for k = 1:4
            for l = 1:4
                if (i==j || i==k || i==l || j==k || j==l || k==l)
                    continue;
                end
                curValue = arr(i, 1) + arr(j, 2) + arr(k, 3) + arr(l, 4);
                
                if (best_so_far < curValue)
                    best_assignment(i) = 1;
                    best_assignment(j) = 2;
                    best_assignment(k) = 3;
                    best_assignment(l) = 4;
                    best_so_far = curValue;
                end
            end
        end
    end
end
best_assignment
best_so_far
                    
                        
                    
                    
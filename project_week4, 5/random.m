function result = random(Q)
result = q_ran(Q);
    function ran = q_ran(Q)
        % a function that generates an integer number randomly from 1 to Q
        % accepts the integer number Q as an argument and returns a random integer from 1 to Q.
        ran = 1 + floor(Q*rand());
    end
end


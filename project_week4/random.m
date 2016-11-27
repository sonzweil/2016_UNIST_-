function result = random(Q)
%UNTITLED2 이 함수의 요약 설명 위치
%   자세한 설명 위치

result = q_ran(Q)

    function ran = qRan(Q)
        % a function that generates an integer number randomly from 1 to Q
        % accepts the integer number Q as an argument and returns a random integer from 1 to Q.
        
        % prove that your qRan() generates a of “random” integers.
        % Think about how you are going to test it.
        
        1 + floor(Q*rand());
        
    end


end


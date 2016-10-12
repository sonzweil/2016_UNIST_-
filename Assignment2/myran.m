% Q1) 
% Suppose we have a uniform distribution of random numbers, x, in X ? [a, b]. What are the 
% probability density function : 
% the mean :
% the variance :

% When a = 0 and b = 1
% the moment of the random number sequence : 

% Q2)
% take an integer number N as an input variable and spits out a N random number sequence between 0 and 1.

function result = myran(N)

result = zeros(N, 1);
for i = 1:N
    result(i) = rand();
end

result;

end


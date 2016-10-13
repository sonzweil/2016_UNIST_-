% Q1) 
% Suppose we have a uniform distribution of random numbers, x, in [a, b]. 
% What are the probability density function p(x) = 1 / (b - a)
% the mean <x> = (a + b) / 2
% the variance <x^2> - <x>^2 = (a^2 - 3*a*b + b^2) / 12
% When a = 0 and b = 1, the moment of the random number sequence <x^m> = 1 / (m + 1)

% Q2)
% take an integer number N as an input variable and spits out a N random number sequence between 0 and 1.
function result = myran(N)

result = zeros(N, 1);

for i = 1:N
    result(i) = rand();
end

end
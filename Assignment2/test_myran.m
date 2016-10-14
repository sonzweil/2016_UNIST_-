% Q3)
function f = test_myran(N)

N = 1000; % generate 1,000 random numbers
data = myran(N); % from your ¡°myran.m¡± and store them in the memory

bin_width = 0.1; % The size of the bin is set to be 0.1
nbins = 1 / bin_width; % Then, the number of bins becomes this value;
xRange = 0:bin_width:1; % Divide xRange with bin_width from 0 to 1.
counts = hist(data, xRange); % hist returns a row vector containing the number of elements in each bin.

% draw probability density function. 
% To do not change probability, 
% y value should not be 'N./numel(data)', but be 'N.*nbins./numel(data)'. 
% This operation maintains probability density value.
f = counts.*nbins./numel(data);
plot(xRange, f);

% Q) Does it look uniform distribution to you?
% A) Yes, it looks uniform distribution to me.

% Q) Does it match with the expected value of the probability density function? 
% A) Yes, it does except range [0 0.1] [0.9 1]

% Q) If it doesn¡¯t, why?
% A) Because myran() generates (0 1) which doesn't include 0 and 1.



% Q4)
% Generate 100,000 random numbers this time. How does your graph look like this time? More uniform or not?
% I set N = 100000. And I answered questions.
% Q) How does your graph look like this time? More uniform or not?
% A) It looks more uniform.



% Q5)
% Change the bin size from 0.1 to 0.02 for your graph for the case of 3 and 4.
% Q) Does it still have the same probability density function value over the x range? If it doesn¡¯t, why?

% A) When N = 1000, and bin_width = 0.02 
% It's probability density function vibrate too much. It's not seems like
% uniform probability density function.
% Because rand() makes "supposedly random" numbers in sequence. So the number of
% outcomes aren't same. When bin_width became narrow, we could see severe vibration. 

% A) When N = 100000, and bin_width = 0.02
% It's probability density function vibrate a little. We may say this is 
% uniform probability density function.
% When number of sample became larger, we could see it's enough to makes uniform
% distribution with random numbers. If bin_width becomes more narrow
% we can't assure that 'N = 100000' makes randomly uniform distribution.

end


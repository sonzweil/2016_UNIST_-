% Q3)
function test_myran()

% generate 1,000 random numbers from your ¡°myran.m¡± and store them in the memory
N = 100000;
data = myran(N);

% Then, you calculate and draw probability density function of your random number sequence. 
bin_width = 0.01;
xRange = 0:bin_width:1;
N = hist(data, xRange);
nbins = 1 / bin_width;
plot(xRange, N.*nbins./numel(data));


% Does it look uniform distribution to you?
% Does it match with the expected value of the probability density function? 
% If it doesn¡¯t, why?

end


% Q6)
function distribution_test()

N = 100;
while N <= 100000
    data = myran(N);
    
    % same with test_myran.m
    bin_width = 0.01;
    nbins = 1 / bin_width;
    xRange = 0:bin_width:1;
    counts = hist(data, xRange);
    f = (counts.*nbins./numel(data));
    
    % the first moment, expected value is 1/2 = 0.5
    % for integral xf(x)dx, make xf(x) values
    for i=1:(nbins + 1)
        xf(i) = f(i)*((i-1)/nbins);
    end
    % then calculate xf(x)dx values and add them all.
    f_moment = 0;
    index = 1;
    while index <= nbins
        f_moment = f_moment + bin_width*((xf(index) + xf(index + 1)) / 2);
        index = index + 1;
    end
    
    
    % the second moment, expected value is 1/3 = 0.3333
    % for integral x^2f(x)dx, make xxf(x) values
    for i=1:(nbins + 1)
        xxf(i) = f(i)*((i-1)/nbins)^2;
    end
    % then calculate x^2f(x)dx values and add them all.
    s_moment = 0;
    index = 1;
    while index <= nbins
        s_moment = s_moment + bin_width*((xxf(index) + xxf(index + 1)) / 2);
        index = index + 1;
    end
    
    
    % the mean, expected value is 1/2 = 0.5
    % mean is same with the first moment
    mean = f_moment;
    
    
    % the variance, expected value is 1/12 = 0.0833
    % mean is <x^2> - <x>^2, this is same with the second moment - mean square
    var = s_moment - mean^2;
    
    
    % the standard deviation, expected value is (1/12)^0.5 = 0.2887
    std = var^(1/2);
    
    string = ['When then number of random data is ', num2str(N), ' and bin_width is ', num2str(bin_width)];
    disp(string);
    disp('  f_moment,   s_moment,   mean,   var,    std');
    disp([f_moment, s_moment, mean, var, std]);
    
    N = N * 10;
end

end

% Q) What can you say about the trend?
% A) As the number of random data, N, increases all values approaches to expected value

% Q7) 
% Q) Based on your results obtained from 1 to 7,
% can you judge the random number generator in MATLAB 
% is good for your simulation study? Why or why not?
% A) For simulation study it's good for larger number of random data. 
% But It's not good for small number of random data because of poor distribution.

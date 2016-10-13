function distribution_testran()
% for the sequence of N random numbers.
data = myran(100);

% the first moment, expected value is 1/2 = 0.5
% the second moment, expected value is 1/3 = 0.3333
% the mean, expected value is 1/2 = 0.5
% the variance, expected value is 1/12 = 0.0833
% and the standard deviation, expected value is (1/12)^0.5 = 0.2887

N = 100;
while N <= 100000
    f = @(x) integral_handle(data, x); % now x is continuous so... it seems that it makes problem. program dosen't stop.
    f_moment = integral(f, 0, 1);
    s = @(x) x.^2;
    s_moment = integral(s, 0, 1);
    mean = integral(f, 0, 1);
    var = s_moment - mean.^2;
    std = var.^0.5;
    
    disp('  f_moment,   s_moment,   mean,   var,    std');
    disp([f_moment, s_moment, mean, var, std]);
    
    N = N * 10;
end

end


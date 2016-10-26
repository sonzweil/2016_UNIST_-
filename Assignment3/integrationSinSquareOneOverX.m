function integrationSinSquareOneOverX()
%% Example 2: Integration of the function sin2(1/x)
% Consider the function (shown in the figure below) f(x) = sin^2(1/x)
% The integral of this function is hard to solve analytically, but can be evaluated in a
% straightforward manner using MC integration. Here, it is to illustrate the idea of the
% simple "hit-or-miss" algorithm. Use the interval [0,1].

%% (1) Express the estimate of integral as a function of No and N.
% Ans) sin^2(1/x) = (Nzero / N) * A = (Nzero / N) * 1
% Nzero is the number of points landed below the sin^2(1/x)
% N is the number of points
% A is the area of square x ¡ô [0, 1] and y ¡ô [0, 1]

%% (2) For N =10K, 100K, 500K, one Million, 5 Million, and 10 Million, obtain and show the estimates.
N = [10000, 100000, 500000, 1000000, 5000000, 10000000];
nthElement = 1;
numOfElement = length(N);
index = 1;
A = 1;
Nzero = 0;

while nthElement <= numOfElement
    % make N random points
    numOfPoints = N(nthElement);
    x = rand(numOfPoints,1);
    y = rand(numOfPoints,1);
    
    % estimating
    while index <= numOfPoints
        if y(index) < sin(1 / x(index)) * sin(1 / x(index))
            Nzero = Nzero + 1;
        end
        index = index + 1;
    end
    estimate(nthElement) = (Nzero / numOfPoints);
    
    % showing results
    disp(['N : ', num2str(numOfPoints), ',', ' sin^2(1/x) : ', num2str(estimate(nthElement))])
    
    % initialize and get ready for nextElement by increasing nthElement value
    index = 1;
    Nzero = 0;
    nthElement = nthElement + 1;
end

%% (3) Using the following MATLAB code, we can get the correct answer to the fifth decimal. Draw a figure of the absolute error of your estimates as a function of N. Can you tell anything about the dependence of the absolute error on N (use the log scale on N)?
syms x
i = int(sin(1/x)*sin(1/x),0,1);
correctValue = eval(i);

% get absolute error of my estimate
nthElement = 1;
while nthElement <= numOfElement
    absErrorOfEstimate(nthElement) = abs(correctValue - estimate(nthElement));
    nthElement = nthElement + 1;
end

plot(N, absErrorOfEstimate, '*');
xlabel('N');
ylabel('absErrorOfEstimate');
set(gca,'XScale','log');

end

function buffonsNeedle()
% a needle of unit length is dropped between two parallel lines that are 1 unit apart.
% What is the probability that the needle intersects one of the lines?
% Draw the plot of the estimate of the probability of intersection vs. N (in log scale, where N ~ upto 10^6).

N = [1000, 3333, 10000, 33333, 100000, 333333, 1000000];

nthElement = 1;
numOfElement = length(N);
index = 1;
Nzero = 0;

while nthElement <= numOfElement
    % make N random points
    numOfPoints = N(nthElement);
    u = (1/2) * rand(numOfPoints,1); % the distance from the nearest line by u
    v = 2 * pi * rand(numOfPoints,1); % the angle measured from the axis parallel to the two lines by v
    
    % estimating
    while index <= numOfPoints
        if u(index) < (1 / 2) * sin(v(index)) % the needle intersects the two lines if u ¡Â (1/2)sin v
            Nzero = Nzero + 1;
        end
        index = index + 1;
    end
    estimate(nthElement) = (Nzero / numOfPoints);
    
    % showing results
    disp(['N : ', num2str(numOfPoints), ',', ' probability : ', num2str(estimate(nthElement))])
    
    % initialize and get ready for nextElement by increasing nthElement value
    index = 1;
    Nzero = 0;
    nthElement = nthElement + 1;
end

plot(N, estimate, '*');
xlabel('N');
ylabel('probability');
set(gca,'XScale','log');

% Ans) probability is 0.318

end


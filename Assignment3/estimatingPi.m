function estimatingPi()
%% Problem 1: Estimating the value of ¥ð
% Function generates N random points in the square x ¡ô [-1, 1] and y ¡ô [-1, 1].
% Then we calculate how many of those points landed inside the unit circle.

%% (1) Express ¥ð as a function of No and N.
% Ans) ¥ð = (Nzero / N) * A = (Nzero / N) * 4
% Nzero is the number of points landed inside the unit circle
% N is the number of points
% A is the area of square x ¡ô [-1, 1] and y ¡ô [-1, 1]

%% (2)Show the figure of the distribution of 1000 random points inside the square circle geometry (exemplary figure is given below)
A = 4; 
index = 1;
Nzero = 0;
N = 1000;
x = -1 + (1+1)*rand(N,1);
y = -1 + (1+1)*rand(N,1);

hold on
t = 0 : (pi / 50) : (2 * pi);
a = cos(t);
b = sin(t);
plot(a, b); % draw circle
plot(x, y, '.'); % draw N generated points
hold off

%% (3) For N =1000, 2000, ¡¦., 10000, obtain and show the estimates.
format short g
while N <= 10000
    % make N random points
    x = -1 + (1+1)*rand(N,1);
    y = -1 + (1+1)*rand(N,1);
    
    % estimating
    while index <= N
        if x(index)^2 + y(index)^2 < 1
            Nzero = Nzero + 1;
        end
        index = index + 1;
    end
    estimate = (Nzero / N) * A;
    
    % showing results
    disp(['N : ', num2str(N), ',', ' pi : ', num2str(estimate)])
    
    N = N + 1000; % increase N by 1000 for the next number of points
end

end


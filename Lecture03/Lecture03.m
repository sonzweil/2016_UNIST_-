%% Simple function mode M-file
% Type the following codes and save them as slm.m and fact.m, respectively.
slm(5)
fact(10)

% statTri01
statTri01(3,5)
[A, H] = statTri01(3,5)

% deg2rad
% deg2rad % error
% deg2rad(60,30) % error
% [a,b] = deg2rad(40) % error
deg2rad('Tom') % Wrong input type but funny results! Be careful!
deg2rad(240.0)

%% The other user-defined functions
% ¡°@ operators¡± for anonymous functions and command ¡°inline¡±

f1 = inline('X^2', 'X')
f1(4)

f2 = @(X)X^2
f2(4)

f3 = inline('X.^2', 'X');
f3(1:5)

f4 = @(X)X.^2;
f4(1:5)

g1 = @(X,Y) X^2+Y^2;
g1(1,2)

g2 = inline('X^2+Y^2', 'X', 'Y');
g2(1,2)

%% ¡°if, else, elseif¡± statement
% if (relational, logical, conditional is nonzero, true)
%   statement
% elseif (relational, logical, conditional is nonzero, true)
%   statement
% else
%   statement
% end

x = 2;
if x > 0, x = sqrt(x); end
x

v = exp(1);
if (2^v > v^2)
    disp('2^v is bigger')
else
    disp('v^2 is bigger')
end



if isnan(x)
    disp('Not a number')
elseif isinf(x)
    disp('infinity')
else
    disp('A floating point number')
end



X = [1:10];
testAvg(X)

% Y = [];
% testAvg(Y)

Z = [1:3; 4:6; 7:9];
testAvg(Z)

%% ¡°switch¡± statement
% switch variable (or equation)
%   case value1
%       statement 
%   case value2
%       statement 
%   ......
%
%   otherwise
%       statement
% end

testCount(1)
testCount(2)
testCount(3)
testCount(10)

X = [1:3]
testNorm(X, 1)
testNorm(X, 2)
testNorm(X, inf)
% testNorm(X, 4)

% example03(-100)
% example03(sqrt(2))
example03(10)
example03(5)

%% ¡°for¡± statement
% for index = initial : increment : final
%   statement
% end

n = 5; A = eye(n);
for j = 2:n
    for i = 1:j-1
        A(i,j) = i/j;
        A(j,i) = i/j;
    end
end
A

X = [];
X0 = [1 1 1]';

A = [0 -6 -1; 6 2 -16; -5 20 -10];

for t = 0:0.01:1
    X = [X expm(t*A)*X0];
end

plot3(X(1,:), X(2,:), X(3,:), '-o')
grid on

%% ¡°while¡± statement
% while (relational, logical, conditional is nonzero, true)
%   statement
% end

x = 1;
while 1
    xmin = x;
    x = x/2;
    if x==0
        break
    end
end
xmin

%% ¡°try-catch¡± block
% try
%   statement1
%   statement2
%   statement3
%   ......
% catch
%   statement4
%   statement5
%   ......
% end

x = ones(5, 3)
y = 3*eye(4);
try
    z = x*y;
catch
    z = nan;
    disp('x and y have different size.')
end
z

%% More examples...
% a matrix for array...

board = [1 2 3; 4 5 6; 7 8 9];
for x = board
    x
end

% even a string array...
for x = 'ICMS390'
    disp(x)
end



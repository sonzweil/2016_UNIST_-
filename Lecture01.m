%% Help
help transpose
help linspace
help complex
help conj
help angle

%% Formats of expression: numeric and non-numeric

% Numeric
x = 1
y = x + 1

% char array (string) expression
x = 1
y = 'x + 1'
class(y)
eval(y)

% Non-numeric
syms x y
y = x + x

%% Predefined variables
pi % 3.14...
eps % 2^(-52) about 2.22e-16
inf % 1/0
i % sqrt(-1)
j % same as i
NaN % Not a number 0/0
computer % computer type
version % matlab version
flops % number of floating point calculations
realmax % largest floating point number
realmin % smallest floating point number

%% Uniformly spaced vectors
1:5
7:-2:-3 
1:-0.25:0

a = linspace(1,-1,9)

%% Vectors, arithmetic
x = [-1 0 1]', y = [3 4 5]'
x'*y % same as inner (dot) prouct, dot(x,y)
cross(c,y) % outer (cross) product

%% Array examples
% Default direction of arithmetic calculation in MATLAB is along ¡°COLUMN¡± direction
A = [1 1 1; 1 2 3; 1 3 6]
sum(A)

% transpose, diag, rank, det, inv, subarray, ...
A = [2 1 3; -1 0 1; 4 2 6]

transpose(A) % same as A'
rank(A)
det(A)
inv(A) % same as A^-1

A(:, 2:3)

% Constructing matrices using predefined commands
I = eye(3, 3)
Y = zeros(3, 5)
Z = ones(2)
M = magic(4)

% Transpose of a matrix, again, and complex numbers.
x = [1; 2+i; 3]

x' % conjugate transpose = Hermitian transpose
x.' % non-conjugate transpose

real(x)
imag(z)

%% Addressing sub-arrays
% single indexing of matrices counts down columns, starting at the top left.

X = [4 5 3 9; 10 4 66 20; 18 -3 2 0]
X([1 2], [3 4])

X(5) = 100

%% Special arrays
% Special predefined arrays:
% zeros(R,C), zeros(N)
% ones(R,C), ones(N)
% eye(R,C), eye(N)
% rand(R,C), rand(N)

%% Section 1 Title
% size = the number of rows and columns, length = the larger of these two
% diag = matrix  vector operator for diagonal elements
% reshape = resize fixed set of elements, columnwise approach to reordering the values
Y = [5 6 7 8]
diag(Y)

X = rand(3, 4)
diag(X)

Z = [1 2 3 4; 5 6 7 8; 9 10 11 12]
reshape(Z, 2, 6)

%% Solving A * x = b
% InMATLAB, x=A\b or x=inv(A)*b
A = [0 9 8; 7 4 5; 4 4 2];
b = [6; 8; 0];
x = A\b
A*x

%% Dealing with complex numbers
% Euler¡¯s formula
% note that in MATLAB angles are expressed in radian
w = (-1)^0.25
exp(i*pi)
angle(w)
abs(w)

%% Format command
% short(default), short e, long, compact, bank, rat, hex
X = [4/3 1.2345e-6]

format short e % 5 figure, scientific notation
X

format long % 15 digit floating point
X

format compact % omitting extra lines
X

format bank % dollar-cent
X

format rat % rational number
X

format hex
X

format short

%% Floating point numbers to integers
% Predefined functions: round, ceil, floor, fix
round(41/7)
fix(41/7)
round(-41/7)
fix(-41/7)

%% ¡°clear¡± command
clear % Erase all variables
clear variables % Erase all variables
clear global % Erase all global variables
clear functions % Erase all compiled m file and links to mex files
clear all % Erase all above including java package imports
clear import % Erase all java package imports, not in functions
clear classes % Erase definition of classes

%% Relational operators
A = [2 7 6; 9 0 -1; 3 .0 6];
B = [8 .2 0; -3 2 5; 4 -1 7];
rel_AB = A < B

string = 'Mississippi'
string=='s'
sum(string=='s')
sind(0) == 0 % sin value in degree
sind(180) == 0
abs(sind(180)) <= eps

%% ¡°find.m¡± function with relational operators
% k = find(x) returns indices of nonzero elements in array x as array k 
% [ row, col ] = find(x) returns indices of nonzero elements in matrix x
% [ row, col, value ] = find(x) returns indices of nonzero elements in matrix x as column vector

A = [100 1 2; 3 100 4; 5 6 100]
index = find(A == 100)
A(index) = 0
[row, col, value] = find(A)

%% Logical operators and functions

% &; and
% &&; and, but only works on scalar and precedent to & or |
% |; or
% ||; or, but only works on scalar and precedent to & or |
% ~, not
% xor(); exclusive or
% all(); returns 1, if all components in a vector is not zero.
% any(); returns 1, if, at least, one of the components in a vector is not zero.
% isnan(); returns 1 where ¡°NaN¡± is found in a vector
% isfinite(); Returns 1 where the component in a vector is not ¡°NaN¡±
% isinf(); returns 1 where ¡°inf¡± is found in a vector

clear
x = [-1 1 1]; y = [1 2 3];
xor(x>0, y>0)
x > 0 & y > 0
% x > 0 && y > 0; not scalar -> error

any(x>0)
any(x>0) & any(y>0)
any(x>0) && any(y>0)

'Tom' == 'm' | 'Tom' == 'o'
name = input('enter name', 's') % please input name as 'Tom' to understand following examples
name == 'Tom' | name == 'Bob'
% name == 'Tom' || name == 'Bob'; error
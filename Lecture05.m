%% predefined functions for generating arrays
% ones.m
% ones(m, n, p, ...) or ones([m, n, p, ...])
% generates m¡¿n¡¿p¡¿... matrix filled with 1s.
ones(3,2,3)

% repmat.m
% B = repmat( A, [m, n, p, ...] )
% repeats block matrix A, [m, n, p, ...] times, to generate matrix B
% similar to kron.m
A = [1 2; 3 4]
B = repmat(A, [2, 3])
C = kron(eye(2), A)

% cat.m
% B = cat (dim, A1, A2, A3, ...)
% reshape matrices A1, A2, A3, ... to have dim dimensions.
A = [1 2; 3 4];
B = [5 6; 7 8];
C = cat(3, A, B)
size(C)

cat(1, A, B) % is same as [A ; B]
cat(2, A, B) % is [A B].

% reshape.m
% B = reshape (A, m, n, p, ...) or B = reshape (A, [m, n, p, ...])
% reshape matrices A1, A2, A3, ... to have dim dimensions.
M = [1:5; 6:10; 11:15];
M(:,:,2) = [16:20; 21:25; 26:30];
N = reshape(M,6,5)

%% dealing with images...
% size.m
% [M1, M2, M3, ...] = size(X), D = size(X), or M = size(X, dim) 
% returns the size of array X along dim. If dim = 1, size of the row; if dim = 2, size of column, and so on...

% imread.m
% B = imread(¡®file_name.extension¡¯)
% reads the image file and stores it in B as an array

% image.m
% image(B)
% converts image array B to a screen image

A = ones(2,3,4)
[m1, m2, m3] = size(A)
D = size(A)

RGB = imread('ngc6543a.jpg');
figure('pos', [100 100 size(RGB,2) size(RGB, 1)]);
image(RGB)
set(gca, 'pos', [0 0 1 1])

size(RGB)

%% string definition
% Use single quotes. ¡® ¡®
s = 'Hello'
len_s = size(s)
long_s = length(s)
s_val = double(s)
text = char(s_val)

F = reshape(32:127, 32, 3)
ascii = char(F)

x = 'seoul';
y = 'korea';
z = [x y];
z

x = 'seoul ';
z = [x y];
z
% z = [x;y]

x = 'seoul';
z = 'x;y';
z

a = 'apple';
b = 'orange';
c = 'bananas';
abc = char(a, b, c); % char.m automatically adds spacebars so that each string row has the same length.
abc

%% functions dealing with strings of numeric expressions
% eval.m
% a = eval(¡®z¡¯), where z = numeric expression
% [a1, a2, a3, ...] = eval(¡®z¡¯) or eval(¡®[a1, a2, a3, ...] = z¡¯)
% [a1, a2, a3, ...] = eval(¡®z1¡¯, ¡®z2¡¯) try and catch capability
% calculates or evaluate numeric expression z in string to value.

X = 2 + sin(90*pi/180)
Y = 3 + log10(100)
Z = eval('X+Y')
[row, col] = eval('size(rand(2,3))')
% [row, col] = eval(size(rand(2,3)))

A = 1:3;
B = 2:4;
% Z = eval('A*B')
Z = eval('A*B', 'A.*B')

clear all
close all

t = (0:0.001:1)'; % time array --> columnar vector is much faster!
f1 = 50;          % frequency, f1 and f2
f2 = 120;

% size(t)
% randn(size(t)) % randn(n) returns n-by-n matrix containing pseudo-random values drawn from the standard normal distribution


y = sin(2*pi*f1*t) + 2*sin(2*pi*f2*t); % y and yn are columnar vectors, too!
yn = y + 0.5*randn(size(t)); 

plot(t(1:100), yn(1:100));
xlabel('time[msec]');
ylabel('amplitude');
title(['frequency =', ' 50 and 120']);

% num2str.m
% str = num2str(A), str = num2str(A, precision) or str = num2str(A, format)
% converts an array A to string 

% str2num.m
% A = str2num(¡®str¡¯)
% converts a string ¡®str¡¯ to numeric array A

clear all
close all

t = (0:0.001:1)';   % time array --> columnar vector is much faster!
f1 = 50;            % frequency, f1 and f2
f2 = 120;

y = eval('sin(2*pi*f1*t) + 2*sin(2*pi*f2*t)');
yn = y + 0.5*randn(size(t));

plot(t(1:100), yn(1:100));
xlabel('time[msec]');
ylabel('amplitude');
title(['frequency =', ' num2str(f1)', ' and', ' num2str(f2)']);

n = 1;
['M' int2str(n)]

for n=1:3
     
    eval(['M' int2str(n) '= magic(n)'])
     
end
 
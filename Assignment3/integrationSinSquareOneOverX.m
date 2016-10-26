function [ output_args ] = Untitled3( input_args )
%% Example 2: Integration of the function sin2(1/x)
% Consider the function (shown in the figure below) f(x) = sin^2(1/x)

% The integral of this function is hard to solve analytically, but can be evaluated in a
% straightforward manner using MC integration. Here, it is to illustrate the idea of the
% simple "hit-or-miss" algorithm. Use the interval [0,1].
%% (1) Express the estimate of integral as a function of No and N.


%% (2) For N =10K, 100K, 500K, one Million, 5 Million, and 10 Million, obtain and show the estimates.


%% (3) Using the following MATLAB code, we can get the correct answer to the fifth decimal. Draw a figure of the absolute error of your estimates as a function of N. Can you tell anything about the dependence of the absolute error on N (use the log scale on N)?

syms x
i = int(sin(1/x)*sin(1/x),0,1)
eval(i)



Example 2: Integration of the function sin21x
To give an example of a difficult integration task, consider the function (shown in Fig. 3)
f (x) = sin2 1
x
?2 ?1.5 ?1 ?0.5 0 0.5 1 1.5 2
0
0.2
0.4
0.6
0.8
1
x
f(x)
Figure 3: Plot of function sin2(1/x).
The integral of this function is hard to solve analytically, but can be evaluated in a straightforward
manner using MC integration. There are a number of more sophisticated MC
integration techniques (which will be discussed later), but we use this example here to
illustrate the idea of the simple "hit-or-miss" -algorithm.
The aim is to calculate the integral
I =
Z b
a
f (x)dx =
Z b
a
sin2 1
x
dx
We select a = 0 and b = 1. The maximum value of f (x) on this interval is fmax = 1.
Thus the rectangular area where we will randomly drop N points (x, y) is x 2 [0,1] and
y 2 [0, fmax]. Then we count the number of points for which y< f (x). Denote this number
by N0. An estimate of the value of the integral is now given by
Iest =
N0
N (b?a) fmax =
N0
N
We obtain the following results:
N = 100000 I = 0.6706900
N = 1000000 I = 0.6725830
N = 10000000 I = 0.6734556
correct result: I = 0.6734568

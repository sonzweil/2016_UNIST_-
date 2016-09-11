function y = slm(c)
% function slm calculates x = 10^(-b), first,
% and returns sin(x)/x. Here, b = 1, 2, ..., c.

format long
b = 1:c;
x = 10.^(-b);
y = (sin(x)./x)';

end


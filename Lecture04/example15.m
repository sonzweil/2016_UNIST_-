function z = example15

for index=1:3
    temp = testfun;
end

z = temp;


function y = testfun

persistent x

if(isempty(x))
    x = 0;
end

x = x + 1;
y = x;
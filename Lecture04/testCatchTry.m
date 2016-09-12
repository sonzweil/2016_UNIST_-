% testCatchTry.m...
x = ones(5,3);
y = 3*eye(4);

try
    z = x*y;
catch
    z = nan;
    disp('x and y have diffrent size.');
end

z
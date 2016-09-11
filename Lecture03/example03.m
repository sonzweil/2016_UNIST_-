function example03(x)

% this program tells if the number x is even or odd.

if (x~=abs(x))
    error('x is not positive number nor real number.')
elseif (x~=fix(x))
    error('x is not an integer')
end

y = rem(x, 2);

switch y
    case 0
        disp('input number is even.')
    otherwise
        disp('input number is odd.')
end

end
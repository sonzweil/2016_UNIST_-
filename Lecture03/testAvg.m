function y = testAvg(x)
% testAvg returns mean of the elements in a vector x.

m = length(x);

if(~m)
    error('input must be a non-empty vector!');
else
    y = sum(x)/m;
end

end
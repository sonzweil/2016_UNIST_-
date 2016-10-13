function y = integral_handle(data, x)

N = hist(data, x);

y = N./numel(data);
% plot(x,y);
end


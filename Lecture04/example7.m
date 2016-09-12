function [avg, med] = example7(x)
% using subfunctions, this program returns 
% average and median of the elements in a vector.

global m
m = length(x);
avg = calmean(x);
med = calmedian(x);

% subfunctions...
function tavg = calmean(x)
% calculates average...
global m
tavg = sum(x)/m;

function tmed = calmedian(x)
% calculates median...
global m
w = sort(x);
if rem(m,2)==1
    tmed = w((m+1)/2);
else
    tmed = (w(m/2)+w(m/2+1))/2;
end
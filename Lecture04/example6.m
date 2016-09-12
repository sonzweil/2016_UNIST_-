function [avg, med] = example6(x)
% using subfunctions, this program returns 
% average and median of the elements in a vector.

m = length(x);
avg = calmean(x,m);
med = calmedian(x,m);

% subfunctions...
function tavg = calmean(x,m)
% calculates average...
tavg = sum(x)/m;

function tmed = calmedian(x,m)
% calculates median...
w = sort(x);
if rem(m,2)==1
    tmed = w((m+1)/2);
else
    tmed = (w(m/2)+w(m/2+1))/2;
end
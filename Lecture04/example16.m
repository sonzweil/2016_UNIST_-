%% nargin, nargout
% Returns how many input and output arguments are used for m-file functions.
% Therefore, you can write a program doing different things
% depending on the numbers of input or output arguments.

function [avg, med] = example16(x)
% using subfunctions, this program returns 
% average and median of the elements in a vector.

global m
m = length(x);
if nargout==1
    avg = newmean(x);
else
    avg = newmean(x);
    med = newmedian(x);
end


% subfunctions...
function tavg = newmean(x)
% calculates average...
global m
tavg = sum(x)/m;

function tmed = newmedian(x)
% calculates median...
global m
w = sort(x);
if rem(m,2)==1
    tmed = w((m+1)/2);
else
    tmed = (w(m/2)+w(m/2+1))/2;
end
function [area, peri] = statTri01(b, h)
% statTri01 computes the area and the perimeter
% of a right triangle, based on its base and height

area = 0.5 * b.* h;
peri = b + h + sqrt(b.^2 + h.^2);

end
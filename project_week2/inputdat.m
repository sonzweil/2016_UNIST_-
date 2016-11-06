function [ output_args ] = inputdat( input_args )
% nNeighbor = number of interacting nearest neighbor. For 2d square grid, it's 8
global nNeighbor
    nNeighbor=8;
% xdim, ydim, zdim = number of pixels in x, y and z directions. They must be the same in an input microstructure, if any. For 2d simulation, zdim = 1 but this is only for outputting vtk images...
global xdim
    xdim=100;
global ydim
    ydim=100;
global zdim
    zdim=1;
    
% nsp = total number of sites or pixels in the simulation domain. It is equal to
% xdim*ydim for a 2d plane.
global nsp
    nsp = xdim * ydim;

% maxQ = total number of spins. The spin values are from 1 to maxQ.
global maxQ
    maxQ = nsp;

% dx, dy and dz = step of voxel in x, y and z. Just set them up to be 1.0
global dx
    dx = 1.0;
global dy
    dy = 1.0;
global dz
    dz = 1.0;

% set up the global variable called ¡°siteSpin¡±.
% siteSpin = array that stores spin value of each pixel¡¦
global siteSpin

readFile = fopen('test_micro.vtk','r');
for index = 1:215
    str = fgets(readFile);
end

for i = 1:1000
    str = fgets(readFile);
    data = sscanf(str,'%d %d %d %d %d %d %d %d %d %d');
    
    for j = 1:10
        siteSpin(i, j) = data(j, 1);
    end
end

end


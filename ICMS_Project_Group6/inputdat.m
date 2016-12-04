function inputdat() %<<MyeongJun Son>>

% nNeighbor = number of interacting nearest neighbor. For 2d square grid, it's 8
global nNeighbor
    nNeighbor=8;
% xdim, ydim, zdim = number of pixels in x, y and z directions. They must be the same in an input microstructure, if any.
global xdim
    xdim=55;
global ydim
    ydim=33;
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
siteSpin = zeros(ydim, xdim);

% for setup.m 
global areafrac % controlling parameters which specify area fraction of -1 spin
    areafrac = 0.5;
global resume % the function to select one of the options or initial configurationf
    resume = 3;
global infname % stores the name of input microstructure file name
    infname = 'test_micro.vtk';

% for mcIsing2d.m
global maxMCS
maxMCS = 50;
global curMCS
curMCS;
global photoMCSInterval
photoMCSInterval = 25;
global curfracInMCS
curfracInMCS = zeros(maxMCS, 1);

% for evolution.m
global kT
kT = 1;
global J
J = 1;

end
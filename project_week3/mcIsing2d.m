function mcIsing2d()
% the main function which contains the Monte Carlo algorithm for Ising model

% 1) read or prepare initial microstructure using functions in ¡°setup.m¡±
inputdat;
setup

% 2) do Monte Carlo simulation by calling the function, ¡°sweep_Ising()¡±, prepared in
%¡°evolution.m¡±. ¡°sweep_Ising()¡± performs N ( = xdim*ydim) random selection of a
% pixel in the simulation domain and tries the Metropolis algorithm. Then, by calling
% sweep_Ising() in the main function, the simulation time of 1 MCS elapses.
evolution;


end


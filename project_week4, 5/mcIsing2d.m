function mcIsing2d()
% the main function which contains the Monte Carlo algorithm for Ising model

global maxMCS
global curMCS
global photoMCSInterval
global resume

% 1) read or prepare initial microstructure using functions in ¡°setup.m¡±
inputdat;
setup();

% 2) do Monte Carlo simulation by calling the function, ¡°sweep_Ising()¡±, prepared in
%¡°evolution.m¡±. ¡°sweep_Ising()¡± performs N ( = xdim*ydim) random selection of a
% pixel in the simulation domain and tries the Metropolis algorithm. Then, by calling
% sweep_Ising() in the main function, the simulation time of 1 MCS elapses.
if (resume == 0)
    photo();
elseif (resume == 1) || (resume == 2) || (resume == 3)
    for i = 1:maxMCS
        curMCS = i;
        evolution(); % this calls the function "sweep_Ising()"
        
        if curMCS == maxMCS
            photo();
        elseif mod(curMCS - 1, photoMCSInterval) == 0
            photo();
        end
    end
end
end


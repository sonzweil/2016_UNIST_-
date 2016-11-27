function [ output_args ] = evolution( input_args )
% sweep ising tool(pixel개수(xdim*ydim)만큼 뭔가 추가하는 function

    function sweep_ising(N)
        % performs N ( = xdim*ydim) random selection of a pixel in the simulation domain and tries the Metropolis algorithm
        % Then, by calling sweep_Ising() in the main function, the simulation time of 1 MCS elapses.
        % While calling sweep_Ising(), write out the microstructures at the prescribed time interval.
        
        % 1) select a random site,
        
        % 2) using the spin values of the currently selected site and its neighboring sites, calculate energy of the state (i.e., old state),
        
        % 3) select a random spin from possible spin states, for the randomly selected site,
        
        % 4) using the new spin, calculate the energy of the state (i.e., new state),
        
        % 5) calculate energy change, delta E, between new and old state by changing the spin state of the randomly selected site,
        
        % 6) perform the Metropolis algorithm to check if you accept the spin change or not
        
        % 7) once each trial is done, the control is sent back to the top for another trial…
    end

end


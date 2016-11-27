function [ output_args ] = evolution( input_args )
% sweep ising tool(pixel개수(xdim*ydim)만큼 뭔가 추가하는 function
global siteSpin
global J
global kT
global maxMCS
sweep_ising();

    function sweep_ising()
        % performs N ( = xdim*ydim) random selection of a pixel in the simulation domain and tries the Metropolis algorithm
        % Then, by calling sweep_Ising() in the main function, the simulation time of 1 MCS elapses.
        % While calling sweep_Ising(), write out the microstructures at the prescribed time interval.
        
        while i = 1:maxMCS
            % 1) select a random site,
            [row, col] = size(siteSpin);
            randRow = qRan(row);
            randCol = qRan(col);
            
            % 2) using the spin values of the currently selected site and its neighboring sites, calculate energy of the state (i.e., old state),
            Ezero = calculateEnergyState(randRow, randCol)
            
            % 3) select a random spin from possible spin states, for the randomly selected site,
            randomSpin = randPlusMinusOne();
            previousSpin = siteSpin(randRow, randCol);
            siteSpin(randRow, randCol) = randomSpin;
            
            % 4) using the new spin, calculate the energy of the state (i.e., new state),
            E = calculateEnergyState(randRow, randCol)
            
            % 5) calculate energy change, delta E, between new and old state by changing the spin state of the randomly selected site,
            deltaE = E - Ezero;
            
            % 6) perform the Metropolis algorithm to check if you accept the spin change or not
            % If ΔE ≤ 0, accept the change.
            if deltaE <= 0
                continue;
            end
            
            % If ΔE > 0, calculate w = exp(?ΔE/kT).
            % Then, generate a uniform random number r∈[0, 1].
            w = exp(-deltaE/kT);
            r = rand();
            
            % If r < w, accept the change
            if r < w
                continue;
            end
            
            % If r > w, reject the change and restore the old spin for the site i.
            siteSpin(randRow, randCol) = previousSpin;

            % 7) once each trial is done, the control is sent back to the top for another trial…
        end
        
        
    end

    function energyState = calculateEnergyState(randRow, randCol)
        energyState = 0;
        [row, col] = size(siteSpin);
        zeroBoundarySiteSpin = zeros(row + 2, col + 2);
        
        for i=1:row
            for j=1:col
                zeroBoundarySiteSpin(i+1, j+1) = siteSpin(i, j);
            end
        end
        
        for i=randRow-1:randRow+1
            for j=randCol-1:randCol+1
                if randRow == i && randCol == j
                    continue;
                end
                energyState = energyState + zeroBoundarySiteSpin(randRow + 1, randCol + 1) * zeroBoundarySiteSpin(i + 1, j + 1);
            end
        end
        
        energyState = -J * energyState;
        
        % energyState = zeroBoundarySiteSpin(row, col) * zeroBoundarySiteSpin(row - 1, col - 1) + zeroBoundarySiteSpin(row, col) * zeroBoundarySiteSpin(row - 1, col) + zeroBoundarySiteSpin(row, col) * zeroBoundarySiteSpin(row - 1, col + 1) + zeroBoundarySiteSpin(row, col) * zeroBoundarySiteSpin(row, col - 1) + zeroBoundarySiteSpin(row, col) * zeroBoundarySiteSpin(row, col + 1) + zeroBoundarySiteSpin(row, col) * zeroBoundarySiteSpin(row + 1, col - 1) + zeroBoundarySiteSpin(row, col) * zeroBoundarySiteSpin(row + 1, col) + zeroBoundarySiteSpin(row, col) * zeroBoundarySiteSpin(row + 1, col + 1);
    end

    function result = randPlusMinusOne()
        if rand() < 0.5
            result = -1;
        else
            result = 1;
        end
    end
end


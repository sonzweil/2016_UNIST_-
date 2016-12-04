function evolution()

global siteSpin
global J
global kT
global nsp
global xdim
global ydim
 
sweep_ising();

    function sweep_ising()
        % performs N ( = xdim*ydim) random selection of a pixel in the simulation domain and tries the Metropolis algorithm
        % Then, by calling sweep_Ising() in the main function, the simulation time of 1 MCS elapses.
        % While calling sweep_Ising(), write out the microstructures at the prescribed time interval.
        
        for i = 1:nsp
            % 1) select a random site,
            [row, col] = size(siteSpin);
            randRow = random(row);
            randCol = random(col);
            
            % 2) using the spin values of the currently selected site and its neighboring sites, calculate energy of the state (i.e., old state),
            Ezero = calculateEnergyState(randRow, randCol);
            
            % 3) select a random spin from possible spin states, for the randomly selected site,
            randomSpin = randPlusMinusOne();
            previousSpin = siteSpin(randRow, randCol);
            siteSpin(randRow, randCol) = randomSpin;
            
            % 4) using the new spin, calculate the energy of the state (i.e., new state),
            E = calculateEnergyState(randRow, randCol);
            
            % 5) calculate energy change, delta E, between new and old state by changing the spin state of the randomly selected site,
            deltaE = E - Ezero;
            
            % 6) perform the Metropolis algorithm to check if you accept the spin change or not
            % If ツE ‖ 0, accept the change.
            if deltaE <= 0
                continue;
            end
            
            % If ツE > 0, calculate w = exp(-ツE/kT).
            % Then, generate a uniform random number r＃[0, 1].
            w = exp(-deltaE/kT);
            r = rand();
            
            % If r < w, accept the change
            if r < w
                continue;
            end
            
            % If r > w, reject the change and restore the old spin for the site i.
            siteSpin(randRow, randCol) = previousSpin;
            
            % 7) once each trial is done, the control is sent back to the top for another trial・
        end
        
        
    end

    function energyState = calculateEnergyState(randRow, randCol)
        energyState = 0;
        
        for i=randRow-1:randRow+1
            for j=randCol-1:randCol+1
                if (i == randRow) && (j == randCol)
                    continue;
                end
                
                row = getRowIndex(i);
                col = getColIndex(j);
                energyState = energyState + siteSpin(randRow, randCol) * siteSpin(row, col);
            end
        end
        
        
        energyState = -J * energyState;
    end

    function result = randPlusMinusOne()
        if rand() < 0.5
            result = -1;
        else
            result = 1;
        end
    end

    function rowIndex = getRowIndex(i)
        if (i < 1)
            rowIndex = ydim;
        elseif (i > ydim)
            rowIndex = 1;
        else
            rowIndex = i;
        end
    end

    function colIndex = getColIndex(j)
        if (j < 1)
            colIndex = xdim;
        elseif (j > xdim)
            colIndex = 1;
        else
            colIndex = j;
        end
    end
end


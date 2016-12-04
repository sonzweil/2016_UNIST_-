function result = miscell()

global siteSpin
global nsp

result = calculate_mean_magnetization();

    function mean_magnetization = calculate_mean_magnetization()
        % calculates the average magnetization per pixel for the simulation configuration of a given simulation time.
        mean_magnetization = 0;
        [row, col] = size(siteSpin);
        for i = 1:row
            for j=1:col
                mean_magnetization = mean_magnetization + siteSpin(i, j);
            end
        end
        mean_magnetization = mean_magnetization / nsp;
    end

end


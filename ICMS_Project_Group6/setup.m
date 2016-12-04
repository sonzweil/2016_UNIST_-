function setup() %<<MyeongJun Song>>

global siteSpin
global areafrac
global resume
global infname
global nsp
global xdim
global ydim
global zdim

if resume == 0 || resume == 1
    read_micro_vtk(infname);
elseif resume == 2
    setup_init_micro();
elseif resume == 3
    prepare_initmicro_a_circle();
else
    disp('resume should be 1, 2, or 3');
end

    function read_micro_vtk(infname) %<<MyeongJun Song>>
        % 1) it reads micro vtk file as input file
        
        readFile = fopen(infname, 'r');
        
        infDataRowNumber = 1000; % the number of input file's data row
        infDataColNumber = 10; % the number of input file's data col
        
        % skip top 4 lines.
        for index = 1:4
            str = fgets(readFile);
        end
        
        % get xdim, ydim, zdim info from input vtk file
        str = fgets(readFile); % 5th lines in vtk file
        dimensionsCell = strsplit(str);
        xdim = str2num(dimensionsCell{1,2}) - 1;
        ydim = str2num(dimensionsCell{1,3}) - 1;
        zdim = str2num(dimensionsCell{1,4}) - 1;
        nsp = xdim * ydim;
        maxQ = nsp;
        
        % skip lines which aren't cell data parts
        for index = 1:(((xdim + 2) + (ydim + 2) + (zdim + 2)) + 3)
            str = fgets(readFile);
        end
        
        col = 1;
        for i = 1:infDataRowNumber
            str = fgets(readFile);
            curSpin = sscanf(str,'%d %d %d %d %d %d %d %d %d %d');
            
            % In order to make xdim * ydim shaped matrix from infDataRowNumber * infDataColNumber shaped matrix
            for j = 1:infDataColNumber
                siteSpin(floor((i+9)/infDataColNumber), col) = curSpin(j, 1);
                if col == xdim
                    col = 0;
                end
                col = col + 1;
            end
        end
    end

    function setup_init_micro() %<<MyeongJun Song>>
        % 2) it prepares a random initial configuration with prescribed area fraction between 2 possible spin states, 1 or -1.
        curfrac = 0;
        while (areafrac ~= curfrac)
            curNumOfMinusOne = 0;
            
            for i = 1:ydim
                for j = 1:xdim
                    siteSpin(i, j) = randPlusMinusOne();
                end
            end
            
            % areafrac update
            for i = 1:ydim
                for j = 1:xdim
                    if siteSpin(i, j) == -1
                        curNumOfMinusOne = curNumOfMinusOne + 1;
                    end
                end
            end
            curfrac = curNumOfMinusOne/nsp;
            
            % when nsp is odd, curfrac can't be reached to areafrac. This results in infinite loop.
            % The codes at below is for solving such a problem temporary. (Not a good code)
            if (mod(nsp, 2) == 1)
                if (nsp <= 10)
                    error('nsp is too small. This code not support too small size odd value xdim, ydim in configuration.');
                elseif (10 < nsp && nsp <= 100)
                    if (areafrac * 0.9 <= curfrac && curfrac <= areafrac * 1.1)
                        break;
                    end
                elseif (1000 < nsp)
                    if (areafrac * 0.995 <= curfrac && curfrac <= areafrac * 1.005)
                        break;
                    end
                end
            end
            
        end
    end

    function result = randPlusMinusOne() %<<Dahwan Park>>
        if rand() < areafrac
            result = -1;
        else
            result = 1;
        end
    end

    function prepare_initmicro_a_circle() %<<MyeongJun Song>>
        % 3) his function draws a circle
        % with a prescribed radius inside the simulation domain. The circle has spin value of -1, and the
        % matrix has 1 as its spin.
        centerX = ydim/2;
        centerY = xdim/2;
        r = min(xdim, ydim)/4; % radius is adjusted with xdim, ydim to do not reach to the border of matrix
        
        t = 0 : (pi / 50) : (2 * pi);
        x = centerX + r * cos(t);
        y = centerY + r * sin(t);
        
        for row = 1:ydim
            for col = 1:xdim
                siteSpin(row, col) = 1;
            end
        end
        
        for row = 1:ydim
            for col = 1:xdim
                if (row-centerY).^2 + (col-centerX).^2 <= r.^2
                    siteSpin(row, col) = -1;
                end
            end
        end
        
        hold on
        ax = gca;
        ax.XAxisLocation = 'top';
        ax.YAxisLocation = 'left';
        ax.YDir = 'reverse';
        ylabel('rowX','FontSize',11);
        xlabel('colY','FontSize',11);
        plot(y, x);
        
        for row = 1:ydim
            for col = 1:xdim
                if siteSpin(row, col) == 1
                    plot(col, row, '.', 'Color', [0.1, 0.1, 0.1]);
                elseif siteSpin(row, col) == -1
                    plot(col, row, '.', 'Color', [0, 0, 1]);
                end
            end
        end
        hold off
    end
end




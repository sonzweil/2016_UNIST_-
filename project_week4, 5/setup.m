function setup()

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

    function read_micro_vtk(infname)
        % 1) it reads micro vtk file as input file
        
        readFile = fopen(infname, 'r');
        
        infDataRowNumber = 1000; % the number of input file's data row
        infDataColNumber = 10; % the number of input file's data col
        
        % skip file's lines which isn't not cell data parts
        for index = 1:215
            str = fgets(readFile);
        end
        
        col = 1;
        for i = 1:infDataRowNumber
            str = fgets(readFile);
            curSpin = sscanf(str,'%d %d %d %d %d %d %d %d %d %d');
            
            % to make 100 * 100 shaped matrix from 1000 * 10 shaped matrix
            for j = 1:infDataColNumber                
                siteSpin(floor((i+9)/infDataColNumber), col) = curSpin(j, 1);
                if col == xdim
                    col = 0;
                end
                col = col + 1;
            end
        end
    end

    function setup_init_micro()
        % 2) it prepares a random initial configuration with prescribed area fraction between 2 possible spin states, 1 or -1.
        curfrac = 0;
        while areafrac ~= curfrac
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
        end
    end

    function result = randPlusMinusOne()
        if rand() < areafrac
            result = -1;
        else
            result = 1;
        end
    end

    function prepare_initmicro_a_circle()
        % 3) his function draws a circle
        % with a prescribed radius inside the simulation domain. The circle has spin value of -1, and the
        % matrix has 1 as its spin.
        centerX = ydim/2;
        centerY = xdim/2;
        r = min(xdim, ydim)/4;
        
%         centerX2 = 15;
%         centerY2 = 15;
%         r2 = 15;
%         
%         
%         centerX3 = 80;
%         centerY3 = 80;
%         r3 = 12.5;
%         
%         
%         centerX4 = 23;
%         centerY4 = 76;
%         r4 = 15;
%         
%         centerX5 = 75;
%         centerY5 = 24;
%         r5 = 10;
        
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
%         for row = 1:ydim
%             for col = 1:xdim
%                 if (row-centerY2).^2 + (col-centerX2).^2 <= r2.^2
%                     siteSpin(row, col) = -1;
%                 end
%             end
%         end
%         for row = 1:ydim
%             for col = 1:xdim
%                 if (row-centerY3).^2 + (col-centerX3).^2 <= r3.^2
%                     siteSpin(row, col) = -1;
%                 end
%             end
%         end
%         for row = 1:ydim
%             for col = 1:xdim
%                 if (row-centerY4).^2 + (col-centerX4).^2 <= r4.^2
%                     siteSpin(row, col) = -1;
%                 end
%             end
%         end
%         for row = 1:ydim
%             for col = 1:xdim
%                 if (row-centerY5).^2 + (col-centerX5).^2 <= r5.^2
%                     siteSpin(row, col) = -1;
%                 end
%             end
%         end        
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
    end
end




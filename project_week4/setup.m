function setup()

inputdat;

global siteSpin
global areafrac
global resume
global infname
global numberOfResume
global nsp

curfrac = 0;
setup_init_micro();


% 1) it reads micro vtk file as input file, or
% 2) it prepares a random initial configuration with prescribed area fraction between 2 possible spin states, 1 or -1.


%%%% resume 관련 업데이트 필요
    function setup_init_micro()
        
        read_micro_vtk(infname);
        
        while areafrac ~= curfrac
            endOfrow = ceil(numberOfResume / 10);
            endOfcol = mod(numberOfResume, 10);
            curNumOfMinusOne = 0;
            
            if endOfcol == 0
                for i = 1:endOfrow
                    for j = 1:10
                        siteSpin(i, j) = randPlusMinusOne();
                    end
                end
            else
                for i = 1:(endOfrow - 1)
                    for j = 1:10
                        siteSpin(i, j) = randPlusMinusOne();
                    end
                end
                
                i = endOfrow;
                for j = 1:endOfcol
                    siteSpin(i, j) = randPlusMinusOne();
                end
            end
            
            % areafrac update
            for i = 1:1000
                for   j = 1:10
                    if siteSpin(i, j) == -1
                        curNumOfMinusOne = curNumOfMinusOne + 1;
                    end
                end
            end
            curfrac = curNumOfMinusOne/nsp;
        end
    end

    function data = read_micro_vtk(infname)
        
        data = zeros(1000, 10);
        
        readFile = fopen(infname,'r');
        
        for index = 1:215
            str = fgets(readFile);
        end
        
        for i = 1:1000
            str = fgets(readFile);
            curData = sscanf(str,'%d %d %d %d %d %d %d %d %d %d');
            
            for j = 1:10
                data(i, j) = curData(j, 1);
            end
        end
    end

    function result = randPlusMinusOne()
        if rand() < areafrac
            result = -1;
        else
            result = 1;
        end
    end
end




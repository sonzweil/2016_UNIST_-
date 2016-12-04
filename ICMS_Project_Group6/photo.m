function photo() %<<Dahwan Park>>

global curMCS
global resume
global xdim
global ydim
global zdim
global nsp
global siteSpin

if resume == 0 || resume == 1
    write_micro_vtk();
elseif resume == 2
    write_init_micro();
elseif resume == 3
    write_initmicro_a_circle();
else
    disp('resume should be 1, 2, or 3');
end

    function write_micro_vtk() %<<Dahwan Park>>
        if (resume == 0)
            outfname = 'test_micro_1000.vtk';
        else % resume == 1
            outfname = sprintf('%s_%dMCS.vtk', 'test_resume1', curMCS);
        end
        writeFile = fopen(outfname, 'w');
        
        fprintf(writeFile, '%s\n', '# vtk DataFile Version 2.0');
        fprintf(writeFile, '%s\n', ' data set from 2dmcgg');
        fprintf(writeFile, '%s\n', 'ASCII');
        fprintf(writeFile, '%s\n', 'DATASET RECTILINEAR_GRID');
        fprintf(writeFile, '%s %d %d %d\n', 'DIMENSIONS', xdim + 1, ydim + 1, zdim + 1);
        
        fprintf(writeFile, '%s   %d   %s\n', 'X_COORDINATES', xdim + 1, 'Float');
        for index = 1:(xdim + 1)
            fprintf(writeFile, '%8.3f\n', index - 1);
        end
        fprintf(writeFile, '%s   %d   %s\n', 'Y_COORDINATES', ydim + 1, 'Float');
        for index = 1:(ydim + 1)
            fprintf(writeFile, '%8.3f\n', index - 1);
        end
        fprintf(writeFile, '%s   %d   %s\n', 'Z_COORDINATES', zdim + 1, 'Float');
        for index = 1:(zdim + 1)
            fprintf(writeFile, '%8.3f\n', index - 1);
        end
        
        fprintf(writeFile, '%s %d\n', 'CELL_DATA', nsp);
        fprintf(writeFile, '%s %s %s %d\n', 'SCALARS', 'GrainIDs', 'int', 1);
        fprintf(writeFile, '%s %s\n', 'LOOKUP_TABLE', 'default');
        
        for i = 1:ydim
            for j = 1:xdim
                if resume == 0
                    siteSpin(i, j) = siteSpin(i, j) + 1000;
                end
                fprintf(writeFile, '%7d', siteSpin(i, j));
            end
            fprintf(writeFile, '\n');
        end
        
        fclose(writeFile);
    end

    function write_init_micro() %<<Dahwan Park>>
        outfname = sprintf('%s_%dMCS.vtk', 'test_resume2', curMCS);
        writeFile = fopen(outfname, 'w');
        
        fprintf(writeFile, '%s\n', '# vtk DataFile Version 2.0');
        fprintf(writeFile, '%s\n', ' data set from 2dmcgg');
        fprintf(writeFile, '%s\n', 'ASCII');
        fprintf(writeFile, '%s\n', 'DATASET RECTILINEAR_GRID');
        fprintf(writeFile, '%s %d %d %d\n', 'DIMENSIONS', xdim + 1, ydim + 1, zdim + 1);
        
        fprintf(writeFile, '%s   %d   %s\n', 'X_COORDINATES', xdim + 1, 'Float');
        for index = 1:(xdim + 1)
            fprintf(writeFile, '%8.3f\n', index - 1);
        end
        fprintf(writeFile, '%s   %d   %s\n', 'Y_COORDINATES', ydim + 1, 'Float');
        for index = 1:(ydim + 1)
            fprintf(writeFile, '%8.3f\n', index - 1);
        end
        fprintf(writeFile, '%s   %d   %s\n', 'Z_COORDINATES', zdim + 1, 'Float');
        for index = 1:(zdim + 1)
            fprintf(writeFile, '%8.3f\n', index - 1);
        end
        
        fprintf(writeFile, '%s %d\n', 'CELL_DATA', nsp);
        fprintf(writeFile, '%s %s %s %d\n', 'SCALARS', 'GrainIDs', 'int', 1);
        fprintf(writeFile, '%s %s\n', 'LOOKUP_TABLE', 'default');
        
        for i = 1:ydim
            for j = 1:xdim
                fprintf(writeFile, '%7d', siteSpin(i, j));
            end
            fprintf(writeFile, '\n');
        end
        
        fclose(writeFile);
    end

    function write_initmicro_a_circle() %<<Dahwan Park>>
        outfname = sprintf('%s_%dMCS.vtk', 'test_resume3', curMCS);
        writeFile = fopen(outfname, 'w');
        
        fprintf(writeFile, '%s\n', '# vtk DataFile Version 2.0');
        fprintf(writeFile, '%s\n', ' data set from 2dmcgg');
        fprintf(writeFile, '%s\n', 'ASCII');
        fprintf(writeFile, '%s\n', 'DATASET RECTILINEAR_GRID');
        fprintf(writeFile, '%s %d %d %d\n', 'DIMENSIONS', xdim + 1, ydim + 1, zdim + 1);
        
        fprintf(writeFile, '%s   %d   %s\n', 'X_COORDINATES', xdim + 1, 'Float');
        for index = 1:(xdim + 1)
            fprintf(writeFile, '%8.3f\n', index - 1);
        end
        fprintf(writeFile, '%s   %d   %s\n', 'Y_COORDINATES', ydim + 1, 'Float');
        for index = 1:(ydim + 1)
            fprintf(writeFile, '%8.3f\n', index - 1);
        end
        fprintf(writeFile, '%s   %d   %s\n', 'Z_COORDINATES', zdim + 1, 'Float');
        for index = 1:(zdim + 1)
            fprintf(writeFile, '%8.3f\n', index - 1);
        end
        
        fprintf(writeFile, '%s %d\n', 'CELL_DATA', nsp);
        fprintf(writeFile, '%s %s %s %d\n', 'SCALARS', 'GrainIDs', 'int', 1);
        fprintf(writeFile, '%s %s\n', 'LOOKUP_TABLE', 'default');
        
        for i = 1:ydim
            for j = 1:xdim
                fprintf(writeFile, '%7d', siteSpin(i, j));
            end
            fprintf(writeFile, '\n');
        end
        
        fclose(writeFile);
    end

    function magnetizationResult = getMagnetizationCalcResult() %<<Dahwan Park>>
        magnetizationResult = miscell();
    end
end


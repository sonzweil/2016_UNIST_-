function write_micro_vtk()
data = zeros(1000, 10);
readFile = fopen('test_micro.vtk', 'r');
writeFile = fopen('test_micro_1000.vtk','w');

for index = 1:215
    str = fgets(readFile);
    fprintf(writeFile, '%s', str);
end

for i = 1:1000
    str = fgets(readFile);
    data = sscanf(str,'%d %d %d %d %d %d %d %d %d %d');
    
    for j = 1:10
        data(j, 1) = data(j, 1) + 1000;
    end
    
    fprintf(writeFile, '%7d', data);
    fprintf(writeFile, '\n');
end

fclose(writeFile);

end
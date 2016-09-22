vectorIndex = 1;

while true
    v = input('next number ');

    if (v < 0)
        break;
    end
    
    vector(vectorIndex) = v;
    vectorIndex = vectorIndex + 1;
end

vector
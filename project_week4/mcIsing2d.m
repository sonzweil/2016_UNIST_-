function mcIsing2d()
% the main function which contains the Monte Carlo algorithm for Ising model

% 1) read or prepare initial microstructure using functions in “setup.m”
inputdat;
setup

% 2) do Monte Carlo simulation by calling the function, “sweep_Ising()”, prepared in
%“evolution.m”. “sweep_Ising()” performs N ( = xdim*ydim) random selection of a
% pixel in the simulation domain and tries the Metropolis algorithm. Then, by calling
% sweep_Ising() in the main function, the simulation time of 1 MCS elapses.

% 전체에너지 구할필요없이 랜덤하게 고른 사이트와 neighbor를 이용해서 interaction에너지를 old 에너지로 가정하고 계산
% 1,-1을 랜덤하게 스핀으로 준다
evolution;


end


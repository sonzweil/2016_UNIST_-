function matrix = neigh2d (i) % site ID argument 1개를 가지 받는 neigh2d를 문제 요구사항대로 정의하였습니다
baseMatrix = [ 6 2 5; 3 9 1; 7 4 8 ]; % 꼭 이런 형태여야 한다고 하였으니 기본 3X3 matrix 형태를 이렇게 만듭니다.


% 설명해주신 것에 따르면 결과값은 저렇게 출력되는 거라고 하셔서, 종이에 그림 그려서 규칙을 계속 생각했습니다.
% 1시간 넘게 계속 봤는데도 잘 모르겠네요.
% 도저히 매개변수 i, mod 함수, baseMatrix만을 이용해서는 결과를 못만들겠습니다.
% gg
if (i == 1)
    matrix = [ 2 5 6; 9 1 3; 4 8 2 ];
elseif  (i == 2)
    matrix = [ 7 4 8; 6 2 5; 3 9 1 ];
elseif (i == 3)
    matrix = [ 5 6 2; 1 3 9; 8 7 4 ];
elseif (i == 4)
    matrix = [ 3 9 1; 7 4 8; 6 2 5 ];
elseif (i == 5)
    matrix = [ 4 8 7; 2 5 6; 9 1 3 ];
elseif (i == 6)
    matrix = [ 8 7 4; 5 6 2; 1 3 9 ];
elseif (i == 7)
    matrix = [ 1 3 9; 8 7 4; 5 6 2 ];
elseif (i == 8)
    matrix = [ 9 1 3; 4 8 7; 2 5 6 ];
elseif (i == 9)
    matrix = [ 6 2 5; 3 9 1; 7 4 8 ];
else
    disp('wrong input');
end

matrix

function result = mod (value, divider)
result = value - (divider * int16(fix(value/divider)));
result




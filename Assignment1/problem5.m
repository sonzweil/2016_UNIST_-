function matrix = neigh2d (i) % site ID argument 1���� ���� �޴� neigh2d�� ���� �䱸���״�� �����Ͽ����ϴ�
baseMatrix = [ 6 2 5; 3 9 1; 7 4 8 ]; % �� �̷� ���¿��� �Ѵٰ� �Ͽ����� �⺻ 3X3 matrix ���¸� �̷��� ����ϴ�.


% �������ֽ� �Ϳ� ������ ������� ������ ��µǴ� �Ŷ�� �ϼż�, ���̿� �׸� �׷��� ��Ģ�� ��� �����߽��ϴ�.
% 1�ð� �Ѱ� ��� �ôµ��� �� �𸣰ڳ׿�.
% ������ �Ű����� i, mod �Լ�, baseMatrix���� �̿��ؼ��� ����� ������ڽ��ϴ�.
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




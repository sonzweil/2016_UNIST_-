balance = 1000;
interest = 0.08;

for i=1:10
    balance = balance * (interest + 1);
    fprintf('$ %.2f after %d years\n', balance, i);
end

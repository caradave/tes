clc;
close all;

n = -20:20;
A = 2;
N = 5;
n0 = 5;

x1 = @(n) exp(-n) .* (n>-1);
x2 = @(n) A .* ones(1, length(n));              % trucchetto per avere un valore =A per ogni elemento del vettore
x3 = @(n) A .* exp(-1i*2*pi*n/N);
x4 = @(n) A .* (n>-1);
x5 = @(n) A .* ((abs(n-n0)-1)<N);

nexttile
stem(n, x1(n));
nexttile
stem(n, x2(n));
nexttile
stem(n, real(x3(n)));
nexttile
stem(n, imag(x3(n)));
nexttile
stem(n, x4(n));
nexttile
stem(n, x5(n));

E1 = sum(abs(x1(n)) .^ 2);
disp('energia1:'); disp(E1);

P2 = sum(abs(x2(n)).^2)/length(n);
disp('potenza2:'); disp(P2);
P3 = sum(abs(x3(n)).^2)/length(n);
disp('potenza3:'); disp(P3);
P4 = sum(abs(x4(n)).^2)/(length(n)+1);
disp('potenza4:'); disp(P4);

E5 = sum(abs(x5(n)) .^ 2);
disp('energia5:'); disp(E5);


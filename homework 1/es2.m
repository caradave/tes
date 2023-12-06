clc;
close all;
clear all;

a = [1, 2, 1];
b = [3, 2, 1];

h = conv(a, b);
figure, stem([0: 4], h), grid on
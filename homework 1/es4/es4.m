clc;
close all;

xref = audioread('three_ref.wav');
x1 = audioread('four_noise.wav');
x2 = audioread('three_noise.wav');

e_xref = sum(xref.^2)
e_x1 = sum(x1.^2)
e_x2 = sum(x2.^2)

corr_x1 = xcorr(xref, x1);
corr_x2 = xcorr(xref, x2);


clc
clear all
close all
N = 20;
t = -N:N;
s = 5*cos(5*pi*t/3);
period = seqperiod(s);
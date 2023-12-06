clc;
close all;
clear all;

%% punto 1
x1 = [-1, 4, 5, -2, -3];
x2 = [-2, 3, 5, 4, -1];
xref = [-1, 0, 2, 0, -1];

energy_x1 = energyCalculation(x1); % = 55
energy_x2 = energyCalculation(x2); % = 55
energy_xref = energyCalculation(xref); % = 6

alfa1 = sqrt(energy_xref/energy_x1); % = 0.33
alfa2 = sqrt(energy_xref/energy_x2); % = 0.33

x1_norm = CalcVettNorm(x1, alfa1);
x2_norm = CalcVettNorm(x2, alfa2);

energy_x1_norm = energyCalculation(x1_norm);
energy_x2_norm = energyCalculation(x2_norm);

r_xref = xcorr(xref, xref);
r_x1 = xcorr(x1_norm, x1);
r_x2 = xcorr(x2_norm, x2);

energy_r_xref = energyCalculation(r_xref)
energy_r_x1 = energyCalculation(r_x1)
energy_r_x2 = energyCalculation(r_x2)

alfa1_autocorrelazione = sqrt(energy_r_xref/energy_r_x1);
alfa2_autocorrelazione = sqrt(energy_r_xref/energy_r_x2);


%% punto 2
xref_audio = audioread('three_ref.wav');
x1_audio = audioread('four_noise.wav');
x2_audio = audioread('three_noise.wav');

e_xref = sum(xref.^2);
e_x1 = sum(x1.^2);
e_x2 = sum(x2.^2);

r_xref_audio = xcorr(xref_audio, x_ref_audio);
r_x1_audio = xcorr(x1_audio, x1_audio);
r_x2_audio = xcorr(x2_audio, x2_audio);

energy_r_x1_ref = energyCalculation(r_xref_audio);
energy_r_x1_audio = energyCalculation(r_x1_audio);
energy_r_x2_audio = energyCalculation(r_x2_audio);

alfa1_autocorrelazione_audio = sqrt(energy_r_xref_audio/energy_r_x1_audio);
alfa2_autocorrelazione = sqrt(energy_r_xref_audio/energy_r_x2_audio);


function energy = energyCalculation(vett)
    energy = 0;
    for i = 1:length(vett)
        energy = energy + vett(i)^2;
    end
end

function vett_norm = CalcVettNorm(vett, norm)
    vett_norm = [];
    for i = 1:length(vett)
        vett_norm = horzcat(vett_norm, norm*vett(i));
    end
end

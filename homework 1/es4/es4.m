clc;
close all;
clear all;

%% punto 1
% inizializzazione delle funzioni con cui lavorare
x1 = [-1, 4, 5, -2, -3];
x2 = [-2, 3, 5, 4, -1];
xref = [-1, 0, 2, 0, -1];

% calcolo dell'energia delle tre funzioni
energy_x1 = energyCalculation(x1); % = 55
energy_x2 = energyCalculation(x2); % = 55
energy_xref = energyCalculation(xref); % = 6

% calcolo della discrepanza tra l'energia del riferimento e le due funzioni
alfa1 = sqrt(energy_xref/energy_x1); % = 0.33
alfa2 = sqrt(energy_xref/energy_x2); % = 0.33

% calcolo del vettore normalizzato delle funzioni in base all'energia del
% riferimento
x1_norm = CalcVettNorm(x1, alfa1);
x2_norm = CalcVettNorm(x2, alfa2);

% calcolo nuovamente l'energia per controllare il risultato
energy_x1_norm = energyCalculation(x1_norm);
energy_x2_norm = energyCalculation(x2_norm);

% calcolo la differenza tra il segnale di riferimento e i segnali dati,
% calcolo poi l'energia 
e1 = energyCalculation(vettDifference(xref, x1_norm));
e2 = energyCalculation(vettDifference(xref, x2_norm));


%% secondo metodo: attranverso l'autocorrelazione
% calcolo dell'autocorrelazione e della cross correlazione
r_xref = xcorr(xref, xref);
r_x1 = xcorr(xref, x1);
r_x2 = xcorr(xref, x2);

% calcolo dell'energia delle funzione calcolate sopra
energy_r_xref = energyCalculation(r_xref);
energy_r_x1 = energyCalculation(r_x1);
energy_r_x2 = energyCalculation(r_x2);

% calcolo della discrepanza dal valore di riferimento
alfa1_autocorrelazione = sqrt(energy_r_xref/energy_r_x1);
alfa2_autocorrelazione = sqrt(energy_r_xref/energy_r_x2);

% calcolo i vettori normalizzati sui valori di energia ottenuti
r_x1_norm = CalcVettNorm(r_x1, alfa1_autocorrelazione);
r_x2_norm = CalcVettNorm(r_x2, alfa2_autocorrelazione);

% calcolo la differenza di energia tra il segnale di riferimento e i
% segnali normalizzati
e1 = energyCalculation(vettDifference(r_xref, r_x1_norm));
e2 = energyCalculation(vettDifference(r_xref, r_x2_norm));
%% punto 2
xref_audio = audioread('three_ref.wav');
x1_audio = audioread('four_noise.wav');
x2_audio = audioread('three_noise.wav');

e_xref = sum(xref.^2);
e_x1 = sum(x1.^2);
e_x2 = sum(x2.^2);

r_xref_audio = xcorr(xref_audio, xref_audio);
r_x1_audio = xcorr(xref_audio, x1_audio);
r_x2_audio = xcorr(xref_audio, x2_audio);

energy_r_xref_audio = energyCalculation(r_xref_audio);
energy_r_x1_audio = energyCalculation(r_x1_audio);
energy_r_x2_audio = energyCalculation(r_x2_audio);

alfa1_autocorrelazione_audio = sqrt(energy_r_xref_audio/energy_r_x1_audio);
alfa2_autocorrelazione_audio = sqrt(energy_r_xref_audio/energy_r_x2_audio);

% calcolo i vettori normalizzati sui valori di energia ottenuti
r_x1_norm_audio = CalcVettNorm(r_x1_audio, alfa1_autocorrelazione_audio);
r_x2_norm_audio = CalcVettNorm(r_x2_audio, alfa2_autocorrelazione_audio);

% calcolo la differenza di energia tra il segnale di riferimento e i
% segnali normalizzati
r_e1_audio = energyCalculation(vettDifference(r_xref_audio, r_x1_norm_audio));
r_e2_audio = energyCalculation(vettDifference(r_xref_audio, r_x2_norm_audio));


%% funzioni
% calcola il vettore differenza tra la funzione di riferimento e la funzone
% data
function result = vettDifference(ref, x)
    result =  [];
    for i = 1:length(ref)
        result = horzcat(result, ref(i) - x(i));
    end
end

% calcola l'energia del segnale
function energy = energyCalculation(vett)
    energy = 0;
    for i = 1:length(vett)
        energy = energy + vett(i)^2;
    end
end

% crea il vettore normalizzato secondo un valore dato
function vett_norm = CalcVettNorm(vett, norm)
    vett_norm = [];
    for i = 1:length(vett)
        vett_norm = horzcat(vett_norm, norm*vett(i));
    end
end

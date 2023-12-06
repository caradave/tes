clc;
close all;
clear all;


% il primo segnale ha energia finita e potenza uguale a zero
% calcolo dei primo 100 valori, utilizzati come campione, per calcolare
% l'energia
energia_1 = 0; 
for i = 0:100
    energia_1 = energia_1 + exp(-i);
end
energia_1

% il segnale ha energia infinita e potenza finita
potenza_2 = powerCalculation(3*ones(1, 40))

% il terzo segnale ha energia infinita e potenza finita
% l'esponenziale converge a uno, quindi rimane A
potenza_3 = powerCalculation(3*ones(1, 40))


% il quarto segnale ha energia infinita e potenza  finita
potenza_4 = powerCalculation(3*ones(1, 40))

% il quinto segnale ha energia finita e potenza uguale a zero
energia_5 = energyCalculation(3*ones(1, 20))


%% implementazione del calcolo dell'energia e della potenza
function energy = energyCalculation(vett)
    energy = 0;
    for i = 1:length(vett)
        energy = energy + vett(i)^2;
    end
end

function power = powerCalculation(vett)
    power = 0;
    for i = 1:length(vett)
        power = power + vett(i)^2;
    end
    
    power = power/(length(vett)+1);

end

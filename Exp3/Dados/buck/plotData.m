clc, clear all, close all
%% Load data
indutor = importdata('correntebuck.csv');
t1k = importdata('tensaoresistor1khzvmed11_4V.csv');
t3k = importdata('tensaoresistor.csv');
t10k = importdata('tensaoresistor10khz.csv');
indutor(:,3) = (indutor(:,3)-2.5)/40e-3;    %Adjust current

%% Plot data
figure,
plot(indutor(:,1), indutor(:,3), indutor(:,1), min(indutor(:,3)) - 0.3 + indutor(:,2)/max(indutor(:,2)))
title('Corrente no indutor')
ylabel('Corrente [A]')
xlabel('Tempo [s]')
legend('Corrente no indutor [A]', 'Forma de onda de entrada [Adimensional]')
print('il', '-depsc')
!epsfixer.sh
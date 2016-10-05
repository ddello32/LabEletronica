clc, clear all, close all
%% Load data
carga = importdata('rcarga.csv')
t3 = importdata('t3.csv')
t6 = importdata('t6.csv')

%% Plot data
figure,
plot(t3.data(:,1), t3.data(:,2))
title('Tensão no tiristor T3')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('r_vt3', '-depsc')
figure,
plot(t6.data(:,1), -1*t6.data(:,2))
title('Tensão no tiristor T6')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('r_vt6', '-depsc')
figure,
plot(carga.data(:,1), carga.data(:,2))
title('Tensão na carga')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('r_vo', '-depsc')
!epsfixer.sh
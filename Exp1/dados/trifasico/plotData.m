clc, clear all, close all
%% Load data
carga = importdata('carga.csv')
lamp1 = importdata('lampada1.csv')
diodo1 = importdata('diodo1.csv')

%% Plot data
figure,
plot(carga.data(:,1), carga.data(:,4))
title('Tensão na carga')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
axis([-inf inf 0 400])
print('tri_r', '-deps')
figure,
plot(lamp1.data(:,1), lamp1.data(:,4))
title('Tensão na lampada 1')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
axis([-inf inf 0 400])
print('tri_l1', '-deps')
figure,
plot(diodo1.data(:,1), diodo1.data(:,4))
title('Tensão no diodo 1')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('tri_d1', '-deps')
!epsfixer.sh
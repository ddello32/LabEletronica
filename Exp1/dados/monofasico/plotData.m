clc, clear all, close all
%% Load data
carga = importdata('carga.csv')
fonte = importdata('Dados tensão na fonte.csv')

%% Plot data
figure,
plot(carga.data(:,4), carga.data(:,1))
title('Tensão no diodo D3')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('mono_d3', '-deps')
figure,
plot(carga.data(:,4), -1*carga.data(:,2))
title('Tensão no diodo D6')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('mono_d6', '-deps')
figure,
plot(carga.data(:,4), carga.data(:,3))
title('Tensão na carga')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('mono_r', '-deps')
plot(fonte.data(:,1), fonte.data(:,2))
title('Tensão fornecida pela fonte')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('mono_s', '-deps')
!epsfixer.sh
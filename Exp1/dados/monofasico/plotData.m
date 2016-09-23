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
figure,
plot(fonte.data(:,1), fonte.data(:,2))
title('Tensão fornecida pela fonte')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('mono_s', '-deps')
%%
windowSize = 10;
b = (1/windowSize)*ones(1,windowSize);
a = 1;

tensao_deslocada = interp1(fonte.data(:,1) + (6e-4), abs(fonte.data(:,2)),carga.data(:,4));
queda_diodo = filter(b,a,tensao_deslocada) - filter(b,a,carga.data(:,3));
figure,
plot(carga.data(:,4), filter(b,a,tensao_deslocada), carga.data(:,4), filter(b,a,carga.data(:,3)))
ylabel('Tensão [V]')
xlabel('Tempo [s]')
legend('Fonte', 'Carga')
print('abs', '-dpdf')
figure,
plot(carga.data(:,4), queda_diodo)
title('Queda de tensão no diodo')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('diff', '-dpdf')

nanmean(queda_diodo)
!epsfixer.sh
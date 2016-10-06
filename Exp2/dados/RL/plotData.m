clc, clear all, close all
%% Load data
r = importdata('r.csv')
L = importdata('L.csv')
RL = importdata('RL.csv')

%% Plot data
figure,
plot(r.data(:,1), r.data(:,2))
title('Tensão sobre a lâmpada')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('rl_vr', '-depsc')
figure,
plot(L.data(:,1), L.data(:,2))
title('Tensão sobre o indutor')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('r_vl', '-depsc')
figure,
plot(RL.data(:,1), RL.data(:,2))
title('Tensão na carga RL')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
print('r_vrl', '-depsc')
!epsfixer.sh
%% Angulo de extincao
syms x
y = 178*pi/180;
phi = 0.2825795946;
eq = sin(x - phi) - sin(y - phi)*exp(-(x - y)/tan(phi));
S = vpasolve(eq == 0, x, [y, pi + y])
vpa(S-pi)
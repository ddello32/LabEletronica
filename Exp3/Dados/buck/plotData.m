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
figure,
plot(t1k(:,1), t1k(:,3), t1k(:,1), min(t1k(:,3)) - 0.12 + 0.1*t1k(:,2)/max(t1k(:,2)))
title('Tensão de saída (1kHz)')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
legend('Tensão de saída [V]', 'Forma de onda de entrada [Adimensional]')
print('t1k', '-depsc')
figure,
plot(t10k(:,1), t10k(:,3), t10k(:,1), min(t10k(:,3)) - 0.12 + 0.1*t10k(:,2)/max(t10k(:,2)))
title('Tensão de saída (10kHz)')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
legend('Tensão de saída [V]', 'Forma de onda de entrada [Adimensional]')
print('t10k', '-depsc')
figure,
plot(t3k(:,1), t3k(:,3), t3k(:,1), min(t3k(:,3)) - 0.12 + 0.1*t3k(:,2)/max(t3k(:,2)))
title('Tensão de saída (10kHz)')
ylabel('Tensão [V]')
xlabel('Tempo [s]')
legend('Tensão de saída [V]', 'Forma de onda de entrada [Adimensional]')
print('t3k', '-depsc')
%% Fitting
d = 0.1:0.1:0.7;	
v = [4.44 7.09 8.78 9.85 10.5 11 11.3];
L = (12*0.5^2 - 10.3*0.5^2)/(2*10.3*3000*0.25/12)
fit = @(x) 11.36*(x/100)^2/((x/100)^2 +  0.02055);
teor = @(x) 12*(x/100)^2/((x/100)^2 + 2*3000*0.25*L/12)
figure,
plot(d*100, v, 'bX')
hold on,
fplot(fit, [0 70], 'g')
fplot(teor, [0 70], 'r')
title('Tensão de saída')
ylabel('Tensão [V]')
xlabel('Duty-Cycle [%]')
legend('Tensão de saída', 'Ajuste da Curva', 'Curva teórica')
print('tvd', '-depsc')
!epsfixer.sh

clc, clear all, close all

%% Carga R
V_source = 100;
R = 50
alfa = 60
%% Simular
sim('r')
monofasico.Ir.DataInfo.Units = 'A';
monofasico.Vr.DataInfo.Units = 'V';
monofasico.Vs.DataInfo.Units = 'V';
monofasico.T1.get('Thyristor current').DataInfo.Units = 'A';
monofasico.T2.get('Thyristor current').DataInfo.Units = 'A';
monofasico.T3.get('Thyristor current').DataInfo.Units = 'A';
monofasico.T4.get('Thyristor current').DataInfo.Units = 'A';
monofasico.T1.get('Thyristor voltage').DataInfo.Units = 'V';
monofasico.T2.get('Thyristor voltage').DataInfo.Units = 'V';
monofasico.T3.get('Thyristor voltage').DataInfo.Units = 'V';
monofasico.T4.get('Thyristor voltage').DataInfo.Units = 'V';
%% Plots
figure,
monofasico.get('Ir').plot
title('Ir')
print('r_ir', '-deps')
figure,
monofasico.get('Vr').plot
title('Vr')
print('r_vr', '-deps')
figure,
monofasico.get('Vs').plot
title('Vs')
print('r_vs', '-deps')
figure,
monofasico.get('T1').get('Thyristor current').plot
title('T1 - Thyristor Current')
print('r_t1i', '-deps')
figure,
monofasico.get('T1').get('Thyristor voltage').plot
title('T1 - Thyristor Voltage')
print('r_t1v', '-deps')
figure,
monofasico.get('T2').get('Thyristor current').plot
title('T4 - Thyristor Current')
print('r_t2i', '-deps')
figure,
monofasico.get('T2').get('Thyristor voltage').plot
title('T2 - Thyristor Voltage')
print('r_t2v', '-deps')
figure,
monofasico.get('T3').get('Thyristor current').plot
title('T3 - Thyristor Current')
print('r_t3i', '-deps')
figure,
monofasico.get('T3').get('Thyristor voltage').plot
title('T3 - Thyristor Voltage')
print('r_t3v', '-deps')
figure,
monofasico.get('T4').get('Thyristor current').plot
title('T4 - Thyristor Current')
print('r_t4i', '-deps')
figure,
monofasico.get('T4').get('Thyristor voltage').plot
title('T4 - Thyristor Voltage')
print('r_t4v', '-deps')
%% Valores medidos
Vr_mean = monofasico.get('Vr_mean').Data(end)
Vr_rms = monofasico.get('Vr_rms').Data(end)
Ir_mean = monofasico.get('Ir_mean').Data(end)
Ir_rms = monofasico.get('Ir_rms').Data(end)
%% Calculo valores teoricos
Vr_meant = V_source*(1 + cos(alfa/180*pi))/pi
Vr_rmst = V_source*sqrt(pi + sin(2*alfa/180*pi)/2- alfa/180*pi)/sqrt(2*pi)
Ir_meant = Vr_meant/R
Ir_rmst = Vr_rmst/R
ret = Vr_mean/Vr_rms*Ir_mean/Ir_rms
ff = Vr_rms/Vr_mean
rett = Vr_meant/Vr_rmst*Ir_meant/Ir_rmst
fft = Vr_rmst/Vr_meant







%% Varrendo alfa
x = 0:5:180
vrr_mean = zeros(1, length(x));
vrr_rms = zeros(1, length(x));
irr_mean = zeros(1, length(x));
irr_rms = zeros(1, length(x));
vrr_meant = zeros(1, length(x));
vrr_rmst = zeros(1, length(x));
irr_meant = zeros(1, length(x));
irr_rmst = zeros(1, length(x));
for i = 1:length(x)
    alfa = x(i)
    sim('r')
    vrr_mean(i) = monofasico.get('Vr_mean').Data(end);
    vrr_rms(i)  = monofasico.get('Vr_rms').Data(end);
    irr_mean(i) = monofasico.get('Ir_mean').Data(end);
    irr_rms(i) = monofasico.get('Ir_rms').Data(end);
    vrr_meant(i) = V_source*(1 + cos(alfa/180*pi))/pi;
    vrr_rmst(i) = V_source*sqrt(pi + sin(2*alfa/180*pi)/2- alfa/180*pi)/sqrt(2*pi);
    irr_meant(i) = vrr_meant(i)/R;
    irr_rmst(i) = vrr_rmst(i)/R;
end
%% Plot
figure,
plot(x, vrr_mean, x, vrr_meant, x, vrr_rms, x, vrr_rmst)
title('Load Voltage')
xlabel('\alpha [\circ]')
ylabel('Voltage [V]')
legend('Mean Value', 'Theoritical Mean Value', 'RMS Value', 'Theoretical RMS Value')
print('r_vrr', '-dpdf')
figure,
plot(x, irr_mean, x, irr_meant, x, irr_rms, x, irr_rmst)
title('Load Current')
xlabel('\alpha [\circ]')
ylabel('Current [A]')
legend('Mean Value', 'Theoritical Mean Value', 'RMS Value', 'Theoretical RMS Value')
print('r_irr', '-dpdf')
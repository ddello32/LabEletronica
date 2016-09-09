clc, clear all, close all

%% Retificador monofasico de onda completa
V_source = 100;
R = 50
%% Simular
sim('monofase')
monofasico.Ir.DataInfo.Units = 'A';
monofasico.Vr.DataInfo.Units = 'V';
monofasico.Vs.DataInfo.Units = 'V';
monofasico.D1.get('Diode current').DataInfo.Units = 'A';
monofasico.D2.get('Diode current').DataInfo.Units = 'A';
monofasico.D3.get('Diode current').DataInfo.Units = 'A';
monofasico.D4.get('Diode current').DataInfo.Units = 'A';
monofasico.D1.get('Diode voltage').DataInfo.Units = 'V';
monofasico.D2.get('Diode voltage').DataInfo.Units = 'V';
monofasico.D3.get('Diode voltage').DataInfo.Units = 'V';
monofasico.D4.get('Diode voltage').DataInfo.Units = 'V';
%% Plots
figure,
monofasico.get('Ir').plot
title('Ir')
print('mono_ir', '-deps')
figure,
monofasico.get('Vr').plot
title('Vr')
print('mono_vr', '-deps')
figure,
monofasico.get('Vs').plot
title('Vs')
print('mono_vs', '-deps')
figure,
monofasico.get('D1').get('Diode current').plot
title('D1 - Diode Current')
print('mono_d1i', '-deps')
figure,
monofasico.get('D1').get('Diode voltage').plot
title('D1 - Diode Voltage')
print('mono_d1v', '-deps')
figure,
monofasico.get('D2').get('Diode current').plot
title('D4 - Diode Current')
print('mono_d2i', '-deps')
figure,
monofasico.get('D2').get('Diode voltage').plot
title('D2 - Diode Voltage')
print('mono_d2v', '-deps')
figure,
monofasico.get('D3').get('Diode current').plot
title('D3 - Diode Current')
print('mono_d3i', '-deps')
figure,
monofasico.get('D3').get('Diode voltage').plot
title('D3 - Diode Voltage')
print('mono_d3v', '-deps')
figure,
monofasico.get('D4').get('Diode current').plot
title('D4 - Diode Current')
print('mono_d4i', '-deps')
figure,
monofasico.get('D4').get('Diode voltage').plot
title('D4 - Diode Voltage')
print('mono_d4v', '-deps')
%% Valores medidos
Vr_mean = monofasico.get('Vr_mean').Data(end)
Vr_rms = monofasico.get('Vr_rms').Data(end)
Ir_mean = monofasico.get('Ir_mean').Data(end)
Ir_rms = monofasico.get('Ir_rms').Data(end)
%% Calculo valores teoricos
Vr_meant = V_source*2/pi
Vr_rmst = V_source/sqrt(2)
Ir_meant = Vr_meant/R
Ir_rmst = Vr_rmst/R
ret = Vr_mean/Vr_rms*Ir_mean/Ir_rms
ff = Vr_rms/Vr_mean
rett = Vr_meant/Vr_rmst*Ir_meant/Ir_rmst
fft = Vr_rmst/Vr_meant
%% Retificador trifasico de onda completa
%% Simular
sim('trifase')
trifasico.Ir.DataInfo.Units = 'A';
trifasico.Vr.DataInfo.Units = 'V';
trifasico.Vs.DataInfo.Units = 'V';
trifasico.D1.get('Diode current').DataInfo.Units = 'A';
trifasico.D2.get('Diode current').DataInfo.Units = 'A';
trifasico.D3.get('Diode current').DataInfo.Units = 'A';
trifasico.D4.get('Diode current').DataInfo.Units = 'A';
trifasico.D5.get('Diode current').DataInfo.Units = 'A';
trifasico.D6.get('Diode current').DataInfo.Units = 'A';
trifasico.D1.get('Diode voltage').DataInfo.Units = 'V';
trifasico.D2.get('Diode voltage').DataInfo.Units = 'V';
trifasico.D3.get('Diode voltage').DataInfo.Units = 'V';
trifasico.D4.get('Diode voltage').DataInfo.Units = 'V';
trifasico.D5.get('Diode voltage').DataInfo.Units = 'V';
trifasico.D6.get('Diode voltage').DataInfo.Units = 'V';
%% Plots
figure,
trifasico.get('Ir').plot
title('Ir')
print('tri_ir', '-deps')
figure,
trifasico.get('Vr').plot
title('Vr')
print('tri_vr', '-deps')
figure,
trifasico.get('Vs').plot
title('Vs')
print('tri_vs', '-deps')
figure,
trifasico.get('D1').get('Diode current').plot
title('D1 - Diode Current')
print('tri_d1i', '-deps')
figure,
trifasico.get('D1').get('Diode voltage').plot
title('D1 - Diode Voltage')
print('tri_d1v', '-deps')
figure,
trifasico.get('D2').get('Diode current').plot
title('D4 - Diode Current')
print('tri_d2i', '-deps')
figure,
trifasico.get('D2').get('Diode voltage').plot
title('D2 - Diode Voltage')
print('tri_d2v', '-deps')
figure,
trifasico.get('D3').get('Diode current').plot
title('D3 - Diode Current')
print('tri_d3i', '-deps')
figure,
trifasico.get('D3').get('Diode voltage').plot
title('D3 - Diode Voltage')
print('tri_d3v', '-deps')
figure,
trifasico.get('D4').get('Diode current').plot
title('D4 - Diode Current')
print('tri_d4i', '-deps')
figure,
trifasico.get('D4').get('Diode voltage').plot
title('D4 - Diode Voltage')
print('tri_d4v', '-deps')
figure,
trifasico.get('D5').get('Diode current').plot
title('D5 - Diode Current')
print('tri_d5i', '-deps')
figure,
trifasico.get('D5').get('Diode voltage').plot
title('D5 - Diode Voltage')
print('tri_d5v', '-deps')
figure,
trifasico.get('D6').get('Diode current').plot
title('D6 - Diode Current')
print('tri_d6i', '-deps')
figure,
trifasico.get('D6').get('Diode voltage').plot
title('D6 - Diode Voltage')
print('tri_d6v', '-deps')
%% Valores medidos
Vr_mean = trifasico.get('Vr_mean').Data(end)
Vr_rms = trifasico.get('Vr_rms').Data(end)
Ir_mean = trifasico.get('Ir_mean').Data(end)
Ir_rms = trifasico.get('Ir_rms').Data(end)
%% Calculo valores teoricos
Vr_meant = V_source*3*sqrt(3)/pi
Vr_rmst = V_source*sqrt(3/2 + 9*sqrt(3)/4/pi)
Ir_meant = Vr_meant/R
Ir_rmst = Vr_rmst/R
ret = Vr_mean/Vr_rms*Ir_mean/Ir_rms
ff = Vr_rms/Vr_mean
rett = Vr_meant/Vr_rmst*Ir_meant/Ir_rmst
fft = Vr_rmst/Vr_meant

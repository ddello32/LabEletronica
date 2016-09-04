clc, clear all, close all

%% Retificador monofasico de onda completa
V_source = 100;
R = 50
%% Simular
sim('monofase')
%% Plots
figure,
monofasico.get('Ir').Values.plot
title('Ir')
print('mono_ir', '-deps')
figure,
monofasico.get('Vr').Values.plot
title('Vr')
print('mono_vr', '-deps')
figure,
monofasico.get('Vs').Values.plot
title('Vs')
print('mono_vs', '-deps')
figure,
monofasico.get('D1').Values.Diode_current.plot
title('D1 - Diode Current')
print('mono_d1i', '-deps')
figure,
monofasico.get('D1').Values.Diode_voltage.plot
title('D1 - Diode Voltage')
print('mono_d1v', '-deps')
figure,
monofasico.get('D2').Values.Diode_current.plot
title('D4 - Diode Current')
print('mono_d2i', '-deps')
figure,
monofasico.get('D2').Values.Diode_voltage.plot
title('D2 - Diode Voltage')
print('mono_d2v', '-deps')
figure,
monofasico.get('D3').Values.Diode_current.plot
title('D3 - Diode Current')
print('mono_d3i', '-deps')
figure,
monofasico.get('D3').Values.Diode_voltage.plot
title('D3 - Diode Voltage')
print('mono_d3v', '-deps')
figure,
monofasico.get('D4').Values.Diode_current.plot
title('D4 - Diode Current')
print('mono_d4i', '-deps')
figure,
monofasico.get('D4').Values.Diode_voltage.plot
title('D4 - Diode Voltage')
print('mono_d4v', '-deps')
%% Valores medidos
Vr_mean = monofasico.get('Vr_mean').Values.Data(end)
Vr_rms = monofasico.get('Vr_rms').Values.Data(end)
Ir_mean = monofasico.get('Ir_mean').Values.Data(end)
Ir_rms = monofasico.get('Ir_rms').Values.Data(end)
%% Calculo valores teoricos
Vr_meant = V_source*2/pi
Vr_rmst = V_source/sqrt(2)
Ir_meant = Vr_meant/R
Ir_rmst = Vr_rmst/R
ret = Vr_mean/Vr_rms*Ir_mean/Ir_rms
ff = Vr_rms/Vr_mean
%% Retificador trifasico de onda completa
%% Simular
sim('trifase')
%% Plots
figure,
trifasico.get('Ir').Values.plot
title('Ir')
print('tri_ir', '-deps')
figure,
trifasico.get('Vr').Values.plot
title('Vr')
print('tri_vr', '-deps')
figure,
trifasico.get('Vs').Values.plot
title('Vs')
print('tri_vs', '-deps')
figure,
trifasico.get('D1').Values.Diode_current.plot
title('D1 - Diode Current')
print('tri_d1i', '-deps')
figure,
trifasico.get('D1').Values.Diode_voltage.plot
title('D1 - Diode Voltage')
print('tri_d1v', '-deps')
figure,
trifasico.get('D2').Values.Diode_current.plot
title('D4 - Diode Current')
print('tri_d2i', '-deps')
figure,
trifasico.get('D2').Values.Diode_voltage.plot
title('D2 - Diode Voltage')
print('tri_d2v', '-deps')
figure,
trifasico.get('D3').Values.Diode_current.plot
title('D3 - Diode Current')
print('tri_d3i', '-deps')
figure,
trifasico.get('D3').Values.Diode_voltage.plot
title('D3 - Diode Voltage')
print('tri_d3v', '-deps')
figure,
trifasico.get('D4').Values.Diode_current.plot
title('D4 - Diode Current')
print('tri_d4i', '-deps')
figure,
trifasico.get('D4').Values.Diode_voltage.plot
title('D4 - Diode Voltage')
print('tri_d4v', '-deps')
figure,
trifasico.get('D5').Values.Diode_current.plot
title('D5 - Diode Current')
print('tri_d5i', '-deps')
figure,
trifasico.get('D5').Values.Diode_voltage.plot
title('D5 - Diode Voltage')
print('tri_d5v', '-deps')
figure,
trifasico.get('D6').Values.Diode_current.plot
title('D6 - Diode Current')
print('tri_d6i', '-deps')
figure,
trifasico.get('D6').Values.Diode_voltage.plot
title('D6 - Diode Voltage')
print('tri_d6v', '-deps')
%% Valores medidos
Vr_mean = trifasico.get('Vr_mean').Values.Data(end)
Vr_rms = trifasico.get('Vr_rms').Values.Data(end)
Ir_mean = trifasico.get('Ir_mean').Values.Data(end)
Ir_rms = trifasico.get('Ir_rms').Values.Data(end)
%% Calculo valores teoricos
Vr_meant = V_source*3*sqrt(3)/pi
Vr_rmst = V_source*sqrt(3/2 + 9*sqrt(2)/4/pi)
Ir_meant = Vr_meant/R
Ir_rmst = Vr_rmst/R
ret = Vr_mean/Vr_rms*Ir_mean/Ir_rms
ff = Vr_rms/Vr_mean

%% Carga RL
V_source = 100;
R = 50
L = 100e-3
alfa = 60
tmax = 2/60
%% Simular
sim('rl')
monofasico.Ir.DataInfo.Units = 'A';
monofasico.Vr.DataInfo.Units = 'V';
monofasico.Vl.DataInfo.Units = 'V';
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
print('rl_ir', '-deps')
figure,
monofasico.get('Vr').plot
title('Vr')
print('rl_vr', '-deps')
figure,
monofasico.get('Vl').plot
title('Vl')
print('rl_vl', '-deps')
figure,
monofasico.get('Vs').plot
title('Vs')
print('rl_vs', '-deps')
figure,
monofasico.get('T1').get('Thyristor current').plot
title('T1 - Thyristor Current')
print('rl_t1i', '-deps')
figure,
monofasico.get('T1').get('Thyristor voltage').plot
title('T1 - Thyristor Voltage')
print('rl_t1v', '-deps')
figure,
monofasico.get('T2').get('Thyristor current').plot
title('T4 - Thyristor Current')
print('rl_t2i', '-deps')
figure,
monofasico.get('T2').get('Thyristor voltage').plot
title('T2 - Thyristor Voltage')
print('rl_t2v', '-deps')
figure,
monofasico.get('T3').get('Thyristor current').plot
title('T3 - Thyristor Current')
print('rl_t3i', '-deps')
figure,
monofasico.get('T3').get('Thyristor voltage').plot
title('T3 - Thyristor Voltage')
print('rl_t3v', '-deps')
figure,
monofasico.get('T4').get('Thyristor current').plot
title('T4 - Thyristor Current')
print('rl_t4i', '-deps')
figure,
monofasico.get('T4').get('Thyristor voltage').plot
title('T4 - Thyristor Voltage')
print('rl_t4v', '-deps')
%% Valores medidos
Vr_mean = monofasico.get('Vr_mean').Data(end)
Vr_rms = monofasico.get('Vr_rms').Data(end)
Vl_mean = monofasico.get('Vl_mean').Data(end)
Vl_rms = monofasico.get('Vl_rms').Data(end)
Ir_mean = monofasico.get('Ir_mean').Data(end)
Ir_rms = monofasico.get('Ir_rms').Data(end)



















%% Carga RL
V_source = 100;
R = 50
L = 1
alfa = 60
tmax = 15/60
%% Simular
sim('rl')
monofasico.Ir.DataInfo.Units = 'A';
monofasico.Vr.DataInfo.Units = 'V';
monofasico.Vl.DataInfo.Units = 'V';
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
print('rl2_ir', '-deps')
figure,
monofasico.get('Vr').plot
title('Vr')
print('rl2_vr', '-deps')
figure,
monofasico.get('Vl').plot
title('Vl')
print('rl2_vl', '-deps')
figure,
monofasico.get('Vs').plot
title('Vs')
print('rl2_vs', '-deps')
figure,
monofasico.get('T1').get('Thyristor current').plot
title('T1 - Thyristor Current')
print('rl2_t1i', '-deps')
figure,
monofasico.get('T1').get('Thyristor voltage').plot
title('T1 - Thyristor Voltage')
print('rl2_t1v', '-deps')
figure,
monofasico.get('T2').get('Thyristor current').plot
title('T4 - Thyristor Current')
print('rl2_t2i', '-deps')
figure,
monofasico.get('T2').get('Thyristor voltage').plot
title('T2 - Thyristor Voltage')
print('rl2_t2v', '-deps')
figure,
monofasico.get('T3').get('Thyristor current').plot
title('T3 - Thyristor Current')
print('rl2_t3i', '-deps')
figure,
monofasico.get('T3').get('Thyristor voltage').plot
title('T3 - Thyristor Voltage')
print('rl2_t3v', '-deps')
figure,
monofasico.get('T4').get('Thyristor current').plot
title('T4 - Thyristor Current')
print('rl2_t4i', '-deps')
figure,
monofasico.get('T4').get('Thyristor voltage').plot
title('T4 - Thyristor Voltage')
print('rl2_t4v', '-deps')
%% Valores medidos
Vr_mean = monofasico.get('Vr_mean').Data(end)
Vr_rms = monofasico.get('Vr_rms').Data(end)
Vl_mean = monofasico.get('Vl_mean').Data(end)
Vl_rms = monofasico.get('Vl_rms').Data(end)
Ir_mean = monofasico.get('Ir_mean').Data(end)
Ir_rms = monofasico.get('Ir_rms').Data(end)
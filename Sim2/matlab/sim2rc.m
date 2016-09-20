%% Carga rc
V_source = 100;
R = 50
C = 100e-6
alfa = 60
tmax = 2/60
%% Simular
sim('rc')
monofasico.Ir.DataInfo.Units = 'A';
monofasico.Vr.DataInfo.Units = 'V';
monofasico.Vc.DataInfo.Units = 'V';
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
print('rc_ir', '-deps')
figure,
monofasico.get('Vr').plot
title('Vr')
print('rc_vr', '-deps')
figure,
monofasico.get('Vc').plot
title('Vc')
print('rc_Vc', '-deps')
figure,
monofasico.get('Vs').plot
title('Vs')
print('rc_vs', '-deps')
figure,
monofasico.get('T1').get('Thyristor current').plot
title('T1 - Thyristor Current')
print('rc_t1i', '-deps')
figure,
monofasico.get('T1').get('Thyristor voltage').plot
title('T1 - Thyristor Voltage')
print('rc_t1v', '-deps')
figure,
monofasico.get('T2').get('Thyristor current').plot
title('T4 - Thyristor Current')
print('rc_t2i', '-deps')
figure,
monofasico.get('T2').get('Thyristor voltage').plot
title('T2 - Thyristor Voltage')
print('rc_t2v', '-deps')
figure,
monofasico.get('T3').get('Thyristor current').plot
title('T3 - Thyristor Current')
print('rc_t3i', '-deps')
figure,
monofasico.get('T3').get('Thyristor voltage').plot
title('T3 - Thyristor Voltage')
print('rc_t3v', '-deps')
figure,
monofasico.get('T4').get('Thyristor current').plot
title('T4 - Thyristor Current')
print('rc_t4i', '-deps')
figure,
monofasico.get('T4').get('Thyristor voltage').plot
title('T4 - Thyristor Voltage')
print('rc_t4v', '-deps')
%% Valores medidos
Vr_mean = monofasico.get('Vr_mean').Data(end)
Vr_rms = monofasico.get('Vr_rms').Data(end)
Vc_mean = monofasico.get('Vc_mean').Data(end)
Vc_rms = monofasico.get('Vc_rms').Data(end)
Ir_mean = monofasico.get('Ir_mean').Data(end)
Ir_rms = monofasico.get('Ir_rms').Data(end)



















%% Carga rc
V_source = 100;
R = 50
C = 1e-3
alfa = 60
tmax = 2/60
%% Simular
sim('rc')
monofasico.Ir.DataInfo.Units = 'A';
monofasico.Vr.DataInfo.Units = 'V';
monofasico.Vc.DataInfo.Units = 'V';
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
print('rc2_ir', '-deps')
figure,
monofasico.get('Vr').plot
title('Vr')
print('rc2_vr', '-deps')
figure,
monofasico.get('Vc').plot
title('Vc')
print('rc2_vc', '-deps')
figure,
monofasico.get('Vs').plot
title('Vs')
print('rc2_vs', '-deps')
figure,
monofasico.get('T1').get('Thyristor current').plot
title('T1 - Thyristor Current')
print('rc2_t1i', '-deps')
figure,
monofasico.get('T1').get('Thyristor voltage').plot
title('T1 - Thyristor Voltage')
print('rc2_t1v', '-deps')
figure,
monofasico.get('T2').get('Thyristor current').plot
title('T4 - Thyristor Current')
print('rc2_t2i', '-deps')
figure,
monofasico.get('T2').get('Thyristor voltage').plot
title('T2 - Thyristor Voltage')
print('rc2_t2v', '-deps')
figure,
monofasico.get('T3').get('Thyristor current').plot
title('T3 - Thyristor Current')
print('rc2_t3i', '-deps')
figure,
monofasico.get('T3').get('Thyristor voltage').plot
title('T3 - Thyristor Voltage')
print('rc2_t3v', '-deps')
figure,
monofasico.get('T4').get('Thyristor current').plot
title('T4 - Thyristor Current')
print('rc2_t4i', '-deps')
figure,
monofasico.get('T4').get('Thyristor voltage').plot
title('T4 - Thyristor Voltage')
print('rc2_t4v', '-deps')
%% Valores medidos
Vr_mean = monofasico.get('Vr_mean').Data(end)
Vr_rms = monofasico.get('Vr_rms').Data(end)
Vc_mean = monofasico.get('Vc_mean').Data(end)
Vc_rms = monofasico.get('Vc_rms').Data(end)
Ir_mean = monofasico.get('Ir_mean').Data(end)
Ir_rms = monofasico.get('Ir_rms').Data(end)
clc, clear all, close all

%% Carga R
V = 12;
R = 2;
L = 330e-6;
C = 220e-6;
D = 80;
f = 10e3;
%% Simular
sim('boost')
results.Ir.DataInfo.Units = 'A';
results.Vr.DataInfo.Units = 'V';
results.Il.DataInfo.Units = 'A';
results.Vl.DataInfo.Units = 'V';
results.Ic.DataInfo.Units = 'A';
results.Vc.DataInfo.Units = 'V';
results.D1.get('MOSFET current').DataInfo.Units = 'A';
results.S2.get('MOSFET current').DataInfo.Units = 'A';
results.D1.get('MOSFET voltage').DataInfo.Units = 'V';
results.S2.get('MOSFET voltage').DataInfo.Units = 'V';
%% Plots
figure,
results.get('Ir').plot
title('Ir')
print('b_ir', '-depsc')
figure,
results.get('Vr').plot
title('Vr')
print('b_vr', '-depsc')
figure,
results.get('Il').plot
title('Il')
print('b_il', '-depsc')
figure,
results.get('Vl').plot
title('Vl')
print('b_vl', '-depsc')
figure,
results.get('Ic').plot
title('Ic')
print('b_ic', '-depsc')
figure,
results.get('Vc').plot
title('Vc')
print('b_vc', '-depsc')
figure,
results.get('D1').get('MOSFET current').plot
title('D1 - MOSFET Current')
print('r_d1i', '-depsc')
figure,
results.get('D1').get('MOSFET voltage').plot
title('D1 - MOSFET Voltage')
print('r_d1v', '-depsc')
figure,
results.get('S2').get('MOSFET current').plot
title('S2 - MOSFET Current')
print('r_s2i', '-depsc')
figure,
results.get('S2').get('MOSFET voltage').plot
title('S2 - MOSFET Voltage')
print('r_s2v', '-depsc')
%% Small time
figure,
plot(results.get('Ir').time(end-100:end) ,results.get('Ir').Data(end-100:end))
title('Ir')
ylabel('Ir (A)')
xlabel('time (s)')
print('b_irst', '-depsc')
figure,
plot(results.get('Vr').time(end-100:end) ,results.get('Vr').Data(end-100:end))
title('Vr')
ylabel('Vr (V)')
xlabel('time (s)')
print('b_vrst', '-depsc')
figure,
plot(results.get('Il').time(end-100:end) ,results.get('Il').Data(end-100:end))
title('Il')
ylabel('Il (A)')
xlabel('time (s)')
print('b_ilst', '-depsc')
figure,
plot(results.get('Vl').time(end-100:end) ,results.get('Vl').Data(end-100:end))
title('Vl')
ylabel('Vl (V)')
xlabel('time (s)')
print('b_vlst', '-depsc')
figure,
plot(results.get('Ic').time(end-100:end) ,results.get('Ic').Data(end-100:end))
title('Ic')
ylabel('Ic (A)')
xlabel('time (s)')
print('b_icst', '-depsc')
figure,
plot(results.get('Vc').time(end-100:end) ,results.get('Vc').Data(end-100:end))
title('Vc')
ylabel('Vc (V)')
xlabel('time (s)')
print('b_vcst', '-depsc')
figure,
plot(results.get('D1').get('MOSFET current').time(end-100:end), results.get('D1').get('MOSFET current').Data(end-100:end))
title('D1 - MOSFET Current')
ylabel('MOSFET Current (A)')
xlabel('time (s)')
print('r_d1ist', '-depsc')
figure,
plot(results.get('D1').get('MOSFET voltage').time(end-100:end), results.get('D1').get('MOSFET voltage').Data(end-100:end))
title('D1 - MOSFET voltage')
ylabel('MOSFET voltage (V)')
xlabel('time (s)')
print('r_d1vst', '-depsc')
figure,
plot(results.get('S2').get('MOSFET current').time(end-100:end), results.get('S2').get('MOSFET current').Data(end-100:end))
title('S2 - MOSFET Current')
ylabel('MOSFET Current (A)')
xlabel('time (s)')
print('r_s2ist', '-depsc')
figure,
plot(results.get('S2').get('MOSFET voltage').time(end-100:end), results.get('S2').get('MOSFET voltage').Data(end-100:end))
title('S2 - MOSFET voltage')
ylabel('MOSFET voltage (V)')
xlabel('time (s)')
print('r_s2vst', '-depsc')
%% Valores medidos
Vr_mean = results.get('Vr_mean').Data(end)
Vr_rms = results.get('Vr_rms').Data(end)
Ir_mean = results.get('Ir_mean').Data(end)
Ir_rms = results.get('Ir_rms').Data(end)
Vr_mean = results.get('Vl_mean').Data(end)
Vr_rms = results.get('Vl_rms').Data(end)
Ir_mean = results.get('Il_mean').Data(end)
Ir_rms = results.get('Il_rms').Data(end)
Vr_mean = results.get('Vc_mean').Data(end)
Vr_rms = results.get('Vc_rms').Data(end)
Ir_mean = results.get('Ic_mean').Data(end)
Ir_rms = results.get('Ic_rms').Data(end)
%% Varrendo D
x = 1e-3:1:100
vrr_mean = zeros(1, length(x));
vrr_meant = zeros(1, length(x));
for i = 1:length(x)
    D = x(i)
    sim('boost')
    vrr_mean(i) = results.get('Vr_mean').Data(end);
    Io = results.get('Io').Data(end);
    Lb = (1 - D/100)^2*D/100*R/f/2;
    if(L < Lb)
        K = L*Io*f/V;
        vrr_meant(i) = V*(1 + (D/100)^2/2/K); 
    else
        vrr_meant(i) = V/(1 - (D/100));
    end
end
%% Plot
figure,
plot(x, vrr_mean, x, vrr_meant)
axis([-inf,inf,-inf,35])
title('Load Voltage')
xlabel('D [%]')
ylabel('Voltage [V]')
legend('Mean Value', 'Theoretical Mean Value')
print('r_vrxd', '-depsc')
%% Para conduçao continua
D = 80
Lb = (1 - D/100)^2*D/100*R/f/2
L = Lb/2;
%% Simular
sim('boost')
results.Ir.DataInfo.Units = 'A';
results.Vr.DataInfo.Units = 'V';
results.Il.DataInfo.Units = 'A';
results.Vl.DataInfo.Units = 'V';
results.Ic.DataInfo.Units = 'A';
results.Vc.DataInfo.Units = 'V';
results.D1.get('MOSFET current').DataInfo.Units = 'A';
results.S2.get('MOSFET current').DataInfo.Units = 'A';
results.D1.get('MOSFET voltage').DataInfo.Units = 'V';
results.S2.get('MOSFET voltage').DataInfo.Units = 'V';
%% Plots
figure,
results.get('Ir').plot
title('Ir')
print('b_ir2', '-depsc')
figure,
results.get('Vr').plot
title('Vr')
print('b_vr2', '-depsc')
figure,
results.get('Il').plot
title('Il')
print('b_il2', '-depsc')
figure,
results.get('Vl').plot
title('Vl')
print('b_vl2', '-depsc')
figure,
results.get('Ic').plot
title('Ic')
print('b_ic2', '-depsc')
figure,
results.get('Vc').plot
title('Vc')
print('b_vc2', '-depsc')
figure,
results.get('D1').get('MOSFET current').plot
title('D1 - MOSFET Current')
print('r_d1i2', '-depsc')
figure,
results.get('D1').get('MOSFET voltage').plot
title('D1 - MOSFET Voltage')
print('r_d1v2', '-depsc')
figure,
results.get('S2').get('MOSFET current').plot
title('S2 - MOSFET Current')
print('r_s2i2', '-depsc')
figure,
results.get('S2').get('MOSFET voltage').plot
title('S2 - MOSFET Voltage')
print('r_s2v2', '-depsc')
%% Valores medidos
Vr_mean = results.get('Vr_mean').Data(end)
Vr_rms = results.get('Vr_rms').Data(end)
Ir_mean = results.get('Ir_mean').Data(end)
Ir_rms = results.get('Ir_rms').Data(end)
Vr_mean = results.get('Vl_mean').Data(end)
Vr_rms = results.get('Vl_rms').Data(end)
Ir_mean = results.get('Il_mean').Data(end)
Ir_rms = results.get('Il_rms').Data(end)
Vr_mean = results.get('Vc_mean').Data(end)
Vr_rms = results.get('Vc_rms').Data(end)
Ir_mean = results.get('Ic_mean').Data(end)
Ir_rms = results.get('Ic_rms').Data(end)

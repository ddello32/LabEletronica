clc, clear all, close all

%% Parametros do motor
P = 1119;
Vnom = 220;
Fnom = 60;
poles = 2;
Rs = 5.56;
Rr = 4.25;
Lls = 0.013;
Llr = 0.013;
Lm = 0.296;
J = 0.0654;
F = 0.005;
%%
Vsour = 220;
Fsour = 60;
wref = 1500;
ti = 1;
tf  = 5.5;
tt = 6;
stime = 9;
%% Simular
sim('ac2')

%% Plots
fig = figure;
results.motor.get('Stator measurements').get('Stator current is_a (A)').plot()
title('Ias')
print('ias', '-depsc')
fig = figure;
results.tref.plot('g')
hold,
results.motor.Mechanical.get('Electromagnetic torque Te (N*m)').plot(),
title('Tem')
ylabel('Torque (N*m)')
xlabel('Time (seconds)')
legend('Tref', 'Tem')
print('tem', '-depsc')
fig = figure;
plot(results.wm.Time, 9.54929659642538*results.wm.Data, results.wref.Time, results.wref.Data)
title('wm')
ylabel('Speed (rad/s)')
xlabel('Time (seconds)')
legend('wm', 'wref')
title('wm')
print('wm', '-depsc')
figure,
slip = (results.ctrl.get('Frequency reference (Hz)')*2*pi - results.motor.Mechanical.get('Rotor speed (wm)'))./(results.ctrl.get('Frequency reference (Hz)')*2*pi);
plot(slip.Data, results.motor.Mechanical.get('Electromagnetic torque Te (N*m)').Data)
title('Torque - Slip')
xlabel('slip')
ylabel('Electromagnetic torque Te (N*m)')
print('ts', '-depsc')
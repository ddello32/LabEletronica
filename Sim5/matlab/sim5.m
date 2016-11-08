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
%% Sim 1
Vsour = 220;
Fsour = 60;
wref = 1500;
ti = 1;
tf  = 5.5;
tt = 6;
stime = 9;
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
legend('Load Torque', 'Tem')
print('tem', '-depsc')
fig = figure;
plot(results.wm.Time, 9.54929659642538*results.wm.Data, results.wref.Time, results.wref.Data, results.ctrl.get('Speed reference (rpm)').Time, results.ctrl.get('Speed reference (rpm)').Data)
title('wm')
ylabel('Speed (rpm)')
xlabel('Time (seconds)')
legend('wm', 'wref', 'controler wref')
title('wm')
print('wm', '-depsc')
figure,
plot(results.slip.Data, results.motor.Mechanical.get('Electromagnetic torque Te (N*m)').Data)
title('Torque - Slip')
xlabel('slip')
ylabel('Electromagnetic torque Te (N*m)')
print('ts', '-depsc')
figure,
results.slip.plot()
title('Slip')
xlabel('Time (seconds)')
ylabel('slip')
print('slip', '-depsc')
%% Sim 2
Vsour = 220;
Fsour = 60;
wref = 1500;
ti = 0;
tf  = 1;
tt = 6;
t1 = 1;
t2 = 4;
stime = 9;
sim('ac3')

%% Plots
fig = figure;
results.motor.get('Stator measurements').get('Stator current is_a (A)').plot()
title('Ias')
print('ias2', '-depsc')
fig = figure;
results.tref.plot('g')
hold,
results.motor.Mechanical.get('Electromagnetic torque Te (N*m)').plot(),
title('Tem')
ylabel('Torque (N*m)')
xlabel('Time (seconds)')
legend('Load Torque', 'Tem')
print('tem2', '-depsc')
fig = figure;
plot(results.wm.Time, 9.54929659642538*results.wm.Data, results.wref.Time, results.wref.Data, results.ctrl.get('Speed reference (rpm)').Time, results.ctrl.get('Speed reference (rpm)').Data)
title('wm')
ylabel('Speed (rpm)')
xlabel('Time (seconds)')
legend('wm', 'wref', 'controler wref')
title('wm')
print('wm2', '-depsc')
figure,
plot(results.slip.Data, results.motor.Mechanical.get('Electromagnetic torque Te (N*m)').Data)
title('Torque - Slip')
xlabel('slip')
ylabel('Electromagnetic torque Te (N*m)')
print('ts2', '-depsc')
figure,
results.slip.plot()
title('Slip')
xlabel('Time (seconds)')
ylabel('slip')
print('slip2', '-depsc')
%% Fix eps
!epsfixer.sh
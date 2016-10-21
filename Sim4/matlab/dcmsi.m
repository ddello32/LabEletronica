clc, clear all, close all

%% Parametros do motor
Ra = 1.6;
La = 6.67e-4;
J = 1.1e-4;
B = 1.24e-4;
ke = 0.038;
kt = 0.038;
V = 24;
kTwl = 0;
%% Simular
sim('dcm')
results.Ia.DataInfo.Units = 'A';
results.wm.DataInfo.Units = 'rad/s';
results.Tm.DataInfo.Units = 'N.m';
%% Plots
fig = figure;
results.get('Ia').plot
title('Ia')
makedatatip(fig, [results.Ia.time(find(results.Ia.Data == results.Ia.max, 1)), results.get('Ia').max], {'Ia_{max}'}, {''})
makedatatip(fig, [results.Ia.time(end), results.get('Ia').median], {'Ia_{stable}'}, {''})
print('ia1', '-depsc')
fig = figure;
results.get('Tm').plot
title('Tm')
makedatatip(fig, [results.Tm.time(find(results.Tm.Data == results.Tm.max, 1)), results.get('Tm').max], {'Tm_{max}'}, {''})
makedatatip(fig, [results.Tm.time(end), results.get('Tm').median], {'Tm_{stable}'}, {''})
print('tm1', '-depsc')
fig = figure;
results.get('wm').plot
makedatatip(fig, [results.wm.time(find(results.wm.Data == results.wm.max, 1)), results.get('wm').max], {'\omegam_{max}'}, {''})
makedatatip(fig, [results.wm.time(end), results.get('wm').median], {'\omegam_{stable}'}, {''})
title('wm')
print('wm1', '-depsc')
%% Sim2
kTwl = -5e-4;
sim('dcm')
results.Ia.DataInfo.Units = 'A';
results.wm.DataInfo.Units = 'rad/s';
results.Tm.DataInfo.Units = 'N.m';
fig = figure;
results.get('Ia').plot
title('Ia')
makedatatip(fig, [results.Ia.time(find(results.Ia.Data == results.Ia.max, 1)), results.get('Ia').max], {'Ia_{max}'}, {''})
makedatatip(fig, [results.Ia.time(end), results.get('Ia').median], {'Ia_{stable}'}, {''})
print('ia2', '-depsc')
fig = figure;
results.get('Tm').plot
title('Tm')
makedatatip(fig, [results.Tm.time(find(results.Tm.Data == results.Tm.max, 1)), results.get('Tm').max], {'Tm_{max}'}, {''})
makedatatip(fig, [results.Tm.time(end), results.get('Tm').median], {'Tm_{stable}'}, {''})
print('tm2', '-depsc')
fig = figure;
results.get('wm').plot
makedatatip(fig, [results.wm.time(find(results.wm.Data == results.wm.max, 1)), results.get('wm').max], {'\omegam_{max}'}, {''})
makedatatip(fig, [results.wm.time(end), results.get('wm').median], {'\omegam_{stable}'}, {''})
title('wm')
print('wm2', '-depsc')
%% Sim Power Systems
sim('dcmpower')
fig = figure;
results.get('Motor').get('Speed wm (rad/s)').plot
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(find(results.get('Motor').get('Speed wm (rad/s)').Data == results.get('Motor').get('Speed wm (rad/s)').max, 1)), results.get('Motor').get('Speed wm (rad/s)').max], {'\omegam_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(end), results.get('Motor').get('Speed wm (rad/s)').median], {'\omegam_{stable}'}, {''})
title('wm')
print('wm3', '-depsc')
fig = figure;
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(find(results.get('Motor').get('Armature current ia (A)').Data == results.get('Motor').get('Armature current ia (A)').max, 1)), results.get('Motor').get('Armature current ia (A)').max], {'Ia_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(end), results.get('Motor').get('Armature current ia (A)').median], {'Ia_{stable}'}, {''})
print('ia3', '-depsc')
fig = figure;
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(find(results.get('Motor').get('Electrical torque Te (n m)').Data == results.get('Motor').get('Electrical torque Te (n m)').max, 1)), results.get('Motor').get('Electrical torque Te (n m)').max], {'Tm_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(end), results.get('Motor').get('Electrical torque Te (n m)').median], {'Tm_{stable}'}, {''})
print('tm3', '-depsc')
%% Retificador controlado monofasico
alfa = 0;
V_source = 24*sqrt(2);
sim('ret1')
fig = figure;
results.get('Motor').get('Speed wm (rad/s)').plot
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(find(results.get('Motor').get('Speed wm (rad/s)').Data == results.get('Motor').get('Speed wm (rad/s)').max, 1)), results.get('Motor').get('Speed wm (rad/s)').max], {'\omegam_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(end), results.get('Motor').get('Speed wm (rad/s)').median], {'\omegam_{stable}'}, {''})
title('wm')
print('wm4', '-depsc')
fig = figure;
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(find(results.get('Motor').get('Armature current ia (A)').Data == results.get('Motor').get('Armature current ia (A)').max, 1)), results.get('Motor').get('Armature current ia (A)').max], {'Ia_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(end), results.get('Motor').get('Armature current ia (A)').median], {'Ia_{stable}'}, {''})
print('ia4', '-depsc')
fig = figure;
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(find(results.get('Motor').get('Electrical torque Te (n m)').Data == results.get('Motor').get('Electrical torque Te (n m)').max, 1)), results.get('Motor').get('Electrical torque Te (n m)').max], {'Tm_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(end), results.get('Motor').get('Electrical torque Te (n m)').median], {'Tm_{stable}'}, {''})
print('tm4', '-depsc')
alfa = 90;
sim('ret1')
fig = figure;
results.get('Motor').get('Speed wm (rad/s)').plot
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(find(results.get('Motor').get('Speed wm (rad/s)').Data == results.get('Motor').get('Speed wm (rad/s)').max, 1)), results.get('Motor').get('Speed wm (rad/s)').max], {'\omegam_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(end), results.get('Motor').get('Speed wm (rad/s)').median], {'\omegam_{stable}'}, {''})
title('wm')
print('wm5', '-depsc')
fig = figure;
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(find(results.get('Motor').get('Armature current ia (A)').Data == results.get('Motor').get('Armature current ia (A)').max, 1)), results.get('Motor').get('Armature current ia (A)').max], {'Ia_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(end), results.get('Motor').get('Armature current ia (A)').median], {'Ia_{stable}'}, {''})
print('ia5', '-depsc')
fig = figure;
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(find(results.get('Motor').get('Electrical torque Te (n m)').Data == results.get('Motor').get('Electrical torque Te (n m)').max, 1)), results.get('Motor').get('Electrical torque Te (n m)').max], {'Tm_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(end), results.get('Motor').get('Electrical torque Te (n m)').median], {'Tm_{stable}'}, {''})
print('tm5', '-depsc')
alfa = 0;
V_source = 24;
sim('ret1')
fig = figure;
results.get('Motor').get('Speed wm (rad/s)').plot
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(find(results.get('Motor').get('Speed wm (rad/s)').Data == results.get('Motor').get('Speed wm (rad/s)').max, 1)), results.get('Motor').get('Speed wm (rad/s)').max], {'\omegam_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(end), results.get('Motor').get('Speed wm (rad/s)').median], {'\omegam_{stable}'}, {''})
title('wm')
print('wm9', '-depsc')
fig = figure;
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(find(results.get('Motor').get('Armature current ia (A)').Data == results.get('Motor').get('Armature current ia (A)').max, 1)), results.get('Motor').get('Armature current ia (A)').max], {'Ia_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(end), results.get('Motor').get('Armature current ia (A)').median], {'Ia_{stable}'}, {''})
print('ia9', '-depsc')
fig = figure;
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(find(results.get('Motor').get('Electrical torque Te (n m)').Data == results.get('Motor').get('Electrical torque Te (n m)').max, 1)), results.get('Motor').get('Electrical torque Te (n m)').max], {'Tm_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(end), results.get('Motor').get('Electrical torque Te (n m)').median], {'Tm_{stable}'}, {''})
print('tm9', '-depsc')
alfa = 90;
sim('ret1')
fig = figure;
results.get('Motor').get('Speed wm (rad/s)').plot
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(find(results.get('Motor').get('Speed wm (rad/s)').Data == results.get('Motor').get('Speed wm (rad/s)').max, 1)), results.get('Motor').get('Speed wm (rad/s)').max], {'\omegam_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(end), results.get('Motor').get('Speed wm (rad/s)').median], {'\omegam_{stable}'}, {''})
title('wm')
print('wm10', '-depsc')
fig = figure;
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(find(results.get('Motor').get('Armature current ia (A)').Data == results.get('Motor').get('Armature current ia (A)').max, 1)), results.get('Motor').get('Armature current ia (A)').max], {'Ia_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(end), results.get('Motor').get('Armature current ia (A)').median], {'Ia_{stable}'}, {''})
print('ia10', '-depsc')
fig = figure;
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(find(results.get('Motor').get('Electrical torque Te (n m)').Data == results.get('Motor').get('Electrical torque Te (n m)').max, 1)), results.get('Motor').get('Electrical torque Te (n m)').max], {'Tm_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(end), results.get('Motor').get('Electrical torque Te (n m)').median], {'Tm_{stable}'}, {''})
print('tm10', '-depsc')
%% Com filtro
alfa = 0;
C = 5e-1;
V_source = 24*sqrt(2);
sim('ret2')
fig = figure;
results.get('Motor').get('Speed wm (rad/s)').plot
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(find(results.get('Motor').get('Speed wm (rad/s)').Data == results.get('Motor').get('Speed wm (rad/s)').max, 1)), results.get('Motor').get('Speed wm (rad/s)').max], {'\omegam_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(end), results.get('Motor').get('Speed wm (rad/s)').median], {'\omegam_{stable}'}, {''})
title('wm')
print('wm6', '-depsc')
fig = figure;
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(find(results.get('Motor').get('Armature current ia (A)').Data == results.get('Motor').get('Armature current ia (A)').max, 1)), results.get('Motor').get('Armature current ia (A)').max], {'Ia_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(end), results.get('Motor').get('Armature current ia (A)').median], {'Ia_{stable}'}, {''})
print('ia6', '-depsc')
fig = figure;
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(find(results.get('Motor').get('Electrical torque Te (n m)').Data == results.get('Motor').get('Electrical torque Te (n m)').max, 1)), results.get('Motor').get('Electrical torque Te (n m)').max], {'Tm_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(end), results.get('Motor').get('Electrical torque Te (n m)').median], {'Tm_{stable}'}, {''})
print('tm6', '-depsc')
alfa = 90;
sim('ret2')
fig = figure;
results.get('Motor').get('Speed wm (rad/s)').plot
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(find(results.get('Motor').get('Speed wm (rad/s)').Data == results.get('Motor').get('Speed wm (rad/s)').max, 1)), results.get('Motor').get('Speed wm (rad/s)').max], {'\omegam_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Speed wm (rad/s)').time(end), results.get('Motor').get('Speed wm (rad/s)').median], {'\omegam_{stable}'}, {''})
title('wm')
print('wm7', '-depsc')
fig = figure;
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(find(results.get('Motor').get('Armature current ia (A)').Data == results.get('Motor').get('Armature current ia (A)').max, 1)), results.get('Motor').get('Armature current ia (A)').max], {'Ia_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Armature current ia (A)').time(end), results.get('Motor').get('Armature current ia (A)').median], {'Ia_{stable}'}, {''})
print('ia7', '-depsc')
fig = figure;
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(find(results.get('Motor').get('Electrical torque Te (n m)').Data == results.get('Motor').get('Electrical torque Te (n m)').max, 1)), results.get('Motor').get('Electrical torque Te (n m)').max], {'Tm_{max}'}, {''})
makedatatip(fig, [results.get('Motor').get('Electrical torque Te (n m)').time(end), results.get('Motor').get('Electrical torque Te (n m)').median], {'Tm_{stable}'}, {''})
print('tm7', '-depsc')
%% Bla
C = 1;
V_source = 24*sqrt(2);
sim('ret3')
figure,
results.get('Motor').get('Speed wm (rad/s)').plot
title('wm')
hold on
vline(0, 'r-.', 'a1=180 a2=180')
vline(1, 'r-.', 'a1=0 a2=180')
vline(2, 'r-.', 'a1=180 a2=0')
vline(3, 'r-.', 'a1=90 a2=90')
hold off
print('wm8', '-depsc')
figure,
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
hold on
vline(0, 'r-.', 'a1=180 a2=180')
vline(1, 'r-.', 'a1=0 a2=180')
vline(2, 'r-.', 'a1=180 a2=0')
vline(3, 'r-.', 'a1=90 a2=90')
hold off
print('ia8', '-depsc')
figure,
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
hold on
vline(0, 'r-.', 'a1=180 a2=180')
vline(1, 'r-.', 'a1=0 a2=180')
vline(2, 'r-.', 'a1=180 a2=0')
vline(3, 'r-.', 'a1=0 a2=0')
hold off
print('tm8', '-depsc')
!epsfixer.sh
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
figure,
results.get('Ia').plot
title('Ia')
print('ia1', '-depsc')
figure,
results.get('Tm').plot
title('Tm')
print('tm1', '-depsc')
figure,
results.get('wm').plot
title('wm')
print('wm1', '-depsc')
%% Sim2
kTwl = -5e-4;
sim('dcm')
results.Ia.DataInfo.Units = 'A';
results.wm.DataInfo.Units = 'rad/s';
results.Tm.DataInfo.Units = 'N.m';
figure,
results.get('Ia').plot
title('Ia')
print('ia2', '-depsc')
figure,
results.get('Tm').plot
title('Tm')
print('tm2', '-depsc')
figure,
results.get('wm').plot
title('wm')
print('wm2', '-depsc')
%% Sim Power Systems
sim('dcmpower')
figure,
results.get('Motor').get('Speed wm (rad/s)').plot
title('wm')
print('wm3', '-depsc')
figure,
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
print('ia3', '-depsc')
figure,
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
print('tm3', '-depsc')
%% Retificador controlado monofasico
alfa = 0;
V_source = 24*sqrt(2);
sim('ret1')
figure,
results.get('Motor').get('Speed wm (rad/s)').plot
title('wm')
print('wm4', '-depsc')
figure,
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
print('ia4', '-depsc')
figure,
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
print('tm4', '-depsc')
alfa = 90;
sim('ret1')
figure,
results.get('Motor').get('Speed wm (rad/s)').plot
title('wm')
print('wm5', '-depsc')
figure,
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
print('ia5', '-depsc')
figure,
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
print('tm5', '-depsc')
%% Com filtro
alfa = 0;
C = 5e-1;
V_source = 24*sqrt(2);
sim('ret2')
figure,
results.get('Motor').get('Speed wm (rad/s)').plot
title('wm')
print('wm6', '-depsc')
figure,
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
print('ia6', '-depsc')
figure,
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
print('tm6', '-depsc')
alfa = 90;
sim('ret2')
figure,
results.get('Motor').get('Speed wm (rad/s)').plot
title('wm')
print('wm7', '-depsc')
figure,
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
print('ia7', '-depsc')
figure,
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
print('tm7', '-depsc')
%% Bla
alfa = 0;
alfa2 = 180;
C = 1;
V_source = 24*sqrt(2);
sim('ret3')
figure,
results.get('Motor').get('Speed wm (rad/s)').plot
title('wm')
print('wm6', '-depsc')
figure,
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
print('ia6', '-depsc')
figure,
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
print('tm6', '-depsc')
alfa = 180;
alfa2 = 0;
sim('ret3')
figure,
results.get('Motor').get('Speed wm (rad/s)').plot
title('wm')
print('wm7', '-depsc')
figure,
results.get('Motor').get('Armature current ia (A)').plot
title('Ia')
print('ia7', '-depsc')
figure,
results.get('Motor').get('Electrical torque Te (n m)').plot
title('Tm')
print('tm7', '-depsc')
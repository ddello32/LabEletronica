clc, clear all, close all
%% Parametros do motor
Pnom = 5*745.7;
Wnom = 1750*pi/30;
Tnom = Pnom/Wnom;
Vnom = 240; 
Ra = 2.58;
La = 28e-3;
J = 2.22e-2;
B = 2.95e-3;

% Vnom - kt*wnom = Ra*ia
% Tnom = kt*ia
% Tnom*Ra = kt*(Vnom - kt*wnom)
a = Wnom;
b = -Vnom;
c = Ra*Tnom;
delta = b^2 - 4*a*c;
kt1 = (-b + sqrt(delta))/(2*a)
kt2 = (-b - sqrt(delta))/(2*a)
% Escolhemos kt1 para que a corrente fosse menor (kt2 daria uma corrente
% nominal de 73 A)
kt = kt1
%Sim
Vsource = Vnom;
ftr = 10e3;
D0 = 50;
DF = 100;
Cf = 1e-3;
%Modelo do robo
m = 4;
l = 0.60;
g = 10;
Irob = m*l^2/3;
X = @(t) l*cos(t*pi/180);
Y = @(t) l*sin(t*pi/180);
P = @(t) [X(t); Y(t)];
I = @(p) atan(p(2)/p(1))*180/pi;
D = @(p) m*g*p(1)/2
reduc = 20;
%% Simulacao
sim('dimen')
results.va.DataInfo.Units = 'V';
fig = figure;
results.get('va').plot
title('Va')
print('va1', '-depsc')
fig = figure;
results.motor.get('Armature current ia (A)').plot
title('Ia')
print('ia1', '-depsc')
fig = figure;
results.motor.get('Electrical torque Te (n m)').plot
title('Tm')
print('tm1', '-depsc')
fig = figure;
results.motor.get('Speed wm (rad/s)').plot
title('wm')
print('wm1', '-depsc')

%% Controle Corrente
sim('ctrli')
fig = figure;
results.get('Motor - HBridge').motor.get('Armature current ia (A)').plot
title('Ia')
print('ia2', '-depsc')
%% Controle geral
sim('ctrl')
results.get('Motor - HBridge').va.DataInfo.Units = 'V';
fig = figure;
results.get('Motor - HBridge').get('va').plot
title('Va')
print('va3', '-depsc')
fig = figure;
results.get('Motor - HBridge').motor.get('Armature current ia (A)').plot
title('Ia')
print('ia3', '-depsc')
fig = figure;
results.get('Motor - HBridge').motor.get('Electrical torque Te (n m)').plot
title('Tm')
print('tm3', '-depsc')
fig = figure;
results.get('Motor - HBridge').motor.get('Speed wm (rad/s)').plot
title('wm')
print('wm3', '-depsc')
%% Modelo robo
T = 10;
thetai = 0;
thetaf = 90;
sim('posctrl')
%%
figure,
results.wref.plot('r')
hold
results.wm.plot()
title('wm')
legend('wref', 'wm')
xlabel('Time (seconds)')
ylabel('Speed (rad/s)')
print('wm4', '-depsc')
figure,
plot(results.wm./reduc)
title('w')
xlabel('Time (seconds)')
ylabel('Speed (rad/s)')
print('w4', '-depsc')
figure,
results.posx.plot
title('x')
xlabel('Time (seconds)')
ylabel('X pos (m)')
print('x4', '-depsc')
figure,
results.posy.plot
title('y')
xlabel('Time (seconds)')
ylabel('Y pos (m)')
print('y4', '-depsc')
tm = results.get('Motor - HBridge').motor.get('Electrical torque Te (n m)');
tool = results.twl.data + (tm.data - results.twl.data - B.*results.wm.data).*((Irob/reduc)/(Irob/reduc + J));
figure,
plot(results.twl.time, tool)
title('Tool Torque')
xlabel('Time (seconds)')
ylabel('Torque (N.m)')
print('t4', '-depsc')
fig = figure;
results.get('Motor - HBridge').motor.get('Electrical torque Te (n m)').plot
title('Tm')
print('tm4', '-depsc')
fig = figure;
results.iref.plot('r')
hold
results.ia.plot
title('Ia')
legend('iref', 'ia')
xlabel('Time (seconds)')
ylabel('Current (A)')
print('ia4', '-depsc')
fig = figure;
results.vctrl.plot
title('Duty-Cycle')
ylabel('Duty-Cycle (%)')
xlabel('Time (seconds)')
print('d4', '-depsc')
figure,
results.ew.plot
title('Speed Error')
ylabel('Speed Error (rad/s)')
xlabel('Time (seconds)')
print('ew4', '-depsc')
figure,
plot(results.epos*180./pi)
title('Position Error')
ylabel('Position Error (Deg)')
xlabel('Time (seconds)')
print('ep4', '-depsc')
figure,
plot(results.posref*180./pi, 'r')
hold
plot(results.theta*180./pi)
title('Angular Position')
legend('Theta ref', 'Theta')
ylabel('Angular Position (Deg)')
xlabel('Time (seconds)')
print('theta4', '-depsc')
figure,
results.get('Motor - HBridge').va.plot
title('Va')
ylabel('Va (V)')
xlabel('Time (seconds)')
print('va4', '-depsc')
%% Modelo robo 2
T = 5;
thetai = 0;
thetaf = 70;
thetaf2 = 30;
sim('posctrl2')
figure,
results.wref.plot('r')
hold
results.wm.plot()
title('wm')
legend('wref', 'wm')
xlabel('Time (seconds)')
ylabel('Speed (rad/s)')
print('wm5', '-depsc')
figure,
plot(results.wm./reduc)
title('w')
xlabel('Time (seconds)')
ylabel('Speed (rad/s)')
print('w5', '-depsc')
figure,
results.posx.plot
title('x')
xlabel('Time (seconds)')
ylabel('X pos (m)')
print('x5', '-depsc')
figure,
results.posy.plot
title('y')
xlabel('Time (seconds)')
ylabel('Y pos (m)')
print('y5', '-depsc')
tm = results.get('Motor - HBridge').motor.get('Electrical torque Te (n m)');
tool = results.twl.data + (tm.data - results.twl.data - B.*results.wm.data).*((Irob/reduc)/(Irob/reduc + J));
figure,
plot(results.twl.time, tool)
title('Tool Torque')
xlabel('Time (seconds)')
ylabel('Torque (N.m)')
print('t5', '-depsc')
fig = figure;
results.get('Motor - HBridge').motor.get('Electrical torque Te (n m)').plot
title('Tm')
print('tm5', '-depsc')
fig = figure;
results.iref.plot('r')
hold
results.ia.plot
title('Ia')
legend('iref', 'ia')
xlabel('Time (seconds)')
ylabel('Current (A)')
print('ia5', '-depsc')
fig = figure;
results.vctrl.plot
title('Duty-Cycle')
ylabel('Duty-Cycle (%)')
xlabel('Time (seconds)')
print('d5', '-depsc')
figure,
results.ew.plot
title('Speed Error')
ylabel('Speed Error (rad/s)')
xlabel('Time (seconds)')
print('ew5', '-depsc')
figure,
plot(results.epos*180./pi)
title('Position Error')
ylabel('Position Error (Deg)')
xlabel('Time (seconds)')
print('ep5', '-depsc')
figure,
plot(results.posref*180./pi, 'r')
hold
plot(results.theta*180./pi)
title('Angular Position')
legend('Theta ref', 'Theta')
ylabel('Angular Position (Deg)')
xlabel('Time (seconds)')
print('theta5', '-depsc')
figure,
results.get('Motor - HBridge').va.plot
title('Va')
ylabel('Va (V)')
xlabel('Time (seconds)')
print('va5', '-depsc')
sim('posctrl3')
figure,
plot(results.wref.time(1:end-1), results.wref.data(1:end-1), 'r')
hold
plot(results.wm.time(1:end-1), results.wm.data(1:end-1))
title('wm')
legend('wref', 'wm')
xlabel('Time (seconds)')
ylabel('Speed (rad/s)')
print('wm6', '-depsc')
figure,
plot(results.wm.time(1:end-1), results.wm.data(1:end-1)./reduc)
title('w')
xlabel('Time (seconds)')
ylabel('Speed (rad/s)')
print('w6', '-depsc')
figure,
plot(results.posx.time(1:end-1), results.posx.data(1:end-1))
title('x')
xlabel('Time (seconds)')
ylabel('X pos (m)')
print('x6', '-depsc')
figure,
plot(results.posy.time(1:end-1), results.posy.data(1:end-1))
title('y')
xlabel('Time (seconds)')
ylabel('Y pos (m)')
print('y6', '-depsc')
tm = results.get('Motor - HBridge').motor.get('Electrical torque Te (n m)');
tool = results.twl.data + (tm.data - results.twl.data - B.*results.wm.data).*((Irob/reduc)/(Irob/reduc + J));
figure,
plot(results.twl.time(1:end-1), tool(1:end-1))
title('Tool Torque')
xlabel('Time (seconds)')
ylabel('Torque (N.m)')
print('t6', '-depsc')
fig = figure;
results.get('Motor - HBridge').motor.get('Electrical torque Te (n m)').plot
title('Tm')
print('tm6', '-depsc')
fig = figure;
plot(results.iref.time(1:end-1), results.iref.data(1:end-1), 'r')
hold
plot(results.ia.time(1:end-1), results.ia.data(1:end-1))
title('Ia')
legend('iref', 'ia')
xlabel('Time (seconds)')
ylabel('Current (A)')
print('ia6', '-depsc')
fig = figure;
plot(results.vctrl.time(1:end-1), results.vctrl.data(1:end-1))
title('Duty-Cycle')
ylabel('Duty-Cycle (%)')
xlabel('Time (seconds)')
print('d6', '-depsc')
figure,
plot(results.ew.time(1:end-1), results.ew.data(1:end-1))
title('Speed Error')
ylabel('Speed Error (rad/s)')
xlabel('Time (seconds)')
print('ew6', '-depsc')
figure,
plot(results.epos.time(1:end-1), results.epos.data(1:end-1)*180./pi)
title('Position Error')
ylabel('Position Error (Deg)')
xlabel('Time (seconds)')
print('ep6', '-depsc')
figure,
plot(results.posref.time(1:end-1), results.posref.data(1:end-1)*180./pi, 'r')
hold
plot(results.theta.time(1:end-1), results.theta.data(1:end-1)*180./pi)
title('Angular Position')
legend('Theta ref', 'Theta')
ylabel('Angular Position (Deg)')
xlabel('Time (seconds)')
print('theta6', '-depsc')
figure,
results.get('Motor - HBridge').va.plot
title('Va')
ylabel('Va (V)')
xlabel('Time (seconds)')
print('va6', '-depsc')
%% Sem reducao
reduc = 1;
T = 1;
thetai = 0;
thetaf = 90;
sim('din')
figure,
plot(results.theta.time, results.theta.data*180./pi)
title('Angular Position')
ylabel('Angular Position (Deg)')
xlabel('Time (seconds)')
print('theta7', '-depsc')
figure,
plot(results.wref.time, results.wref.data, 'g')
hold,
plot(results.wm.time, results.wm.data./reduc)
title('wm')
legend('wref', 'wm')
xlabel('Time (seconds)')
ylabel('Speed (rad/s)')
print('wm7', '-depsc')
figure,
plot(results.posx.time, results.posx.data)
title('x')
xlabel('Time (seconds)')
ylabel('X pos (m)')
print('x7', '-depsc')
figure,
plot(results.posy.time, results.posy.data)
title('y')
xlabel('Time (seconds)')
ylabel('Y pos (m)')
print('y7', '-depsc')
fig = figure;
results.get('Motor - HBridge').motor.get('Electrical torque Te (n m)').plot
title('Tm')
print('tm7', '-depsc')
%%
reduc = 1;
T = 5;
thetai = 0;
thetaf = 90;
sim('din')
figure,
plot(results.theta.time, results.theta.data*180./pi)
title('Angular Position')
ylabel('Angular Position (Deg)')
xlabel('Time (seconds)')
print('theta8', '-depsc')
figure,
plot(results.wref.time, results.wref.data, 'g')
hold,
plot(results.wm.time, results.wm.data./reduc)
title('wm')
legend('wref', 'wm')
xlabel('Time (seconds)')
ylabel('Speed (rad/s)')
print('wm8', '-depsc')
figure,
plot(results.posx.time, results.posx.data)
title('x')
xlabel('Time (seconds)')
ylabel('X pos (m)')
print('x8', '-depsc')
figure,
plot(results.posy.time, results.posy.data)
title('y')
xlabel('Time (seconds)')
ylabel('Y pos (m)')
print('y8', '-depsc')
fig = figure;
results.get('Motor - HBridge').motor.get('Electrical torque Te (n m)').plot
title('Tm')
print('tm8', '-depsc')
%%
reduc = 1;
T = 10;
thetai = 0;
thetaf = 90;
sim('din')
figure,
plot(results.theta.time, results.theta.data*180./pi)
title('Angular Position')
ylabel('Angular Position (Deg)')
xlabel('Time (seconds)')
print('theta9', '-depsc')
figure,
plot(results.wref.time, results.wref.data, 'g')
hold,
plot(results.wm.time, results.wm.data./reduc)
title('wm')
legend('wref', 'wm')
xlabel('Time (seconds)')
ylabel('Speed (rad/s)')
print('wm9', '-depsc')
figure,
plot(results.posx.time, results.posx.data)
title('x')
xlabel('Time (seconds)')
ylabel('X pos (m)')
print('x9', '-depsc')
figure,
plot(results.posy.time, results.posy.data)
title('y')
xlabel('Time (seconds)')
ylabel('Y pos (m)')
print('y9', '-depsc')
fig = figure;
results.get('Motor - HBridge').motor.get('Electrical torque Te (n m)').plot
title('Tm')
print('tm9', '-depsc')
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
reduc = 10
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


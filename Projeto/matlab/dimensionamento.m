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

%% Simulacao
Vsource = Vnom;
ftr = 10e3;
D0 = 50;
DF = 100;
Cf = 1e-3;
sim('dimen')
figure,
results.va.plot()

%% Controle
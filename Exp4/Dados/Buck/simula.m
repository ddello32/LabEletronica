clc, clear all, close all

%% Parametros do motor
Ra = 7.9 + 5.3;
La = 6.67e-5;
J = 2.1e-5;
B = 46e-5;
Tf = 0;
ke = 0.07;
kt = 0.07;
V = 12;
L = 330e-6;
kTwl = 0;
f= 3e3;
%% Retificador controlado monofasico
x = 30:10:60;
for i = 1:length(x)
    D = x(i);
    sim('buck')
    v(i) = results.motor.get('Speed wm (rad/s)').median;
end
%%
r = -40.045 + 1.65*x;
plot(x, v, 'b', x, r, 'r', x, [10.6814150222 24.504422698 40.8407044967 60.1091394387], 'rx')
xlabel('D (%)')
ylabel('wm (rad/s)')
legend('Simulação', 'Medido')
print('wd', '-depsc')
!epsfixer.sh
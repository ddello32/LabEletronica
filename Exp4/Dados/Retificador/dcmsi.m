clc, clear all, close all

%% Parametros do motor
Ra = 7.9 + 3.8;
La = 6.67e-5;
J = 1.1e-5;
B = 30e-5;
ke = 0.0536;
kt = 0.0536;
V = 24;
kTwl = 0;
V_source = 24*sqrt(2);
%% Retificador controlado monofasico
x = 60:10:120;
for i = 1:length(x)
    alfa = x(i);
    sim('ret1')
    v(i) = results.Motor.get('Speed wm (rad/s)').median;
end
%%
r = 289.5 - 2.158*x;
plot(x, v, 'b', x, r, 'r', x, [35.6047167407 49.2182849062 68.0678408278 94.2477796077 120.4277183876 141.3716694115 158.1268302307], 'rx')
xlabel('Alfa')
ylabel('wm (rad/s)')

!epsfixer.sh
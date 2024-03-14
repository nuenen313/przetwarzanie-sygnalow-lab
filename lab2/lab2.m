% skrypt do testowania funkcji
clc
clear
close all

N1 = 500;
fs1 = 10000;

N2 = 100;
fs2 = 5000;

time = gen_time(N1, fs1); % 500 próbek, fs = 10 kHz
time2 = gen_time(N2, fs2);

fsin = 100;
A = 2;
fi = pi/4;

sinus1 = gen_sin(time, fsin, A, fi); % fsin = 100 Hz, A = 2, przesunięcie
% fazowe = pi/4

delta1 = gen_delta(time2);

tr = time(2)*250;
tf = time(2)*250;
triangle1 = gen_triangle(time, A, tr, tf);

u = time(length(time)/2);
s = 0.005/10;
gauss1 = gen_gauss(time, u, s);

delta_delayed = sig_delay_N(delta1, 26); % delta przesunięta o 26 próbek

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
figure
plot(time, sinus1, '--ok', 'MarkerSize', 5, 'MarkerEdgeColor','red');
xlabel('czas (s)');
ylabel('A$\sin(t\cdot2\cdot\pi\cdot f_{sin} + f_i)$', 'Interpreter', 'latex');
grid on
title(sprintf('$y = %d \\sin(t\\cdot2\\cdot\\pi\\cdot %d + %.2f)$', A, fsin, fi), 'Interpreter', 'latex')
ylim([min(sinus1)-0.1 max(sinus1)+0.1])

figure
plot(time2, delta1, 'or', 'MarkerSize', 5);
xlabel('czas (s)');
ylabel('x(t)');
grid on
title('Impuls Kroeneckera', 'Interpreter', 'latex');

figure
plot(time, triangle1, '--ok', 'MarkerSize', 5, 'MarkerEdgeColor','blue');
xlabel('czas (s)');
ylabel('x(t)')
grid on
title('Impuls trojkatny', 'Interpreter','latex');

figure
plot(time, gauss1, '--ok', 'MarkerSize', 5, 'MarkerEdgeColor','magenta');
grid on
xlabel('czas (s)')
ylabel('x(t)')
ylim([min(gauss1)-0.1 max(gauss1)+0.1])
title('Impuls Gaussa', 'Interpreter', 'latex')

figure
stem(time2, delta1, 'or', 'MarkerSize', 5);
hold on
stem(time2, delta_delayed, 'ok', 'MarkerSize', 5);
xlabel('czas (s)');
ylabel('x(t)');
grid on
title('Impuls Kroeneckera z przesunieciem', 'Interpreter', 'latex');
legend('Oryginalny sygnal', 'Przesuniety sygnal', 'Interpreter', 'latex')

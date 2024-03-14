clc
clear
close all

time = gen_time(1000, 10000);
rect_pulse = rectpuls(time, time(end)); % impuls prostokątny
exponential = (0.05).^(20*time);

x1 = [1, 2, 3];
x2 = [0, 2, 3];

convolution_result1 = sig_conv(x1, x2)
conv(x1, x2)

convolution_result = sig_conv(rect_pulse, exponential);
time_conv = linspace(time(1), time(end), length(convolution_result));

figure
subplot(3,1,1);
plot(time, rect_pulse, '-r');
subtitle('Impuls prostokatny', 'Interpreter', 'latex')
subplot(3,1,2);
plot(time, exponential, '-b');
subtitle('Funkcja wykladnicza', 'Interpreter', 'latex')
subplot(3,1,3);
plot(time_conv, convolution_result, '-k');
subtitle('Splot', 'Interpreter', 'latex')

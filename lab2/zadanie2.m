clc
clear
close all

N1 = 500;
fs1 = 10000;

time = gen_time(N1, fs1);

%dodawanie sygnałów
fsin = 100;
fsin2 = 200;
A = 2;
A2 = 4;
fi = pi/4;

sinus1 = gen_sin(time, fsin, A, fi); % fsin = 100 Hz, A = 2, przesunięcie
% fazowe = pi/4

sinus2 = gen_sin(time, fsin2, A2, fi);

sinus_dodawanie = sinus1+sinus2;

sinus_mnozenie = sinus1.*sinus2;

k = 10;
sinus_stala = sinus1+k;

A1 = 0.5;
sinus_amplituda = sinus1*A1;

set(groot,'defaultAxesTickLabelInterpreter','latex');
figure
plot(time, sinus1);
hold on
plot(time, sinus2);
hold off
legend('Sygnal 1', 'Sygnal 2', 'Interpreter', 'latex')

figure
plot(time, sinus_dodawanie)
title('Suma sygnalow', 'Interpreter', 'latex')

figure
plot(time, sinus_mnozenie)
title('Mnozenie sygnalow', 'Interpreter', 'latex')

figure
plot(time, sinus_stala)
title('Dodawanie stalej', 'Interpreter','latex')

figure 
plot(time, sinus_amplituda)
title('Zmiana amplitudy', 'Interpreter', 'latex')

# Rozwiązania zadań z laboratorium z Przetwarzania sygnałów 

## Ćwiczenie 2 
W folderze lab2 są funkcje narzędziowe do rozwiązania zadań:
- `gen_time` - na podstawie podanej liczby próbek `N` i częstotliwości próbkowania `fs` generuje jednowymiarową tablicę zawierającą czasy kolejnych próbek,
- `gen_sin` - na podstawie wygenerowanej tabeli z czasami próbek `time` generuje tabelę z przebiegiem sinusoidalnym o częstotliwości `fsin`, amplitudzie `A` i przesunięciu fazowym `fi`,
- `gen_delta` - na podstawie wygenerowanej tabeli z czasami próbek `time` generuje deltę Kroeneckera,
- `gen_triangle` - na podstawie wygenerowanej tabeli z czasami próbek `time` generuje impuls trójkątny o amplitudzie `A`, czasie narostu `tr` i czasie opadania `tf`,
- `gen_gauss` - na podstawie wygenerowanej tabeli z czasami próbek `time` generuje impuls Gaussa, którego środek przypada na czas `u` a szerokość opisano parametrem `s`,
- `sig_delay_N` - opóźnia sygnał `x` o `Nd` próbek.

Dodatkowo plik `lab2.m` zawiera wywołanie powyższych funkcji dla przykładowych parametrów i wyniki przedstawione na wykresach. Każdy wykres to osobne `Figure` w MATLABie, ale można też wyświetlić je na jednym wykresie dla porównania używając polecenia `hold on`. 
W `lab2.m` wykresy są sformatowane tak, żeby tekst był wyświetlany jako LaTeXowy, ale generalnie to można pominąć. Wtedy najprostszym wywołaniem wykresu byłoby:
```
time = gen_time(500, 10000);
sinus = gen_sin(time, fsin, A, fi);
plot(time, sinus);
```

W pliku `sig_conv.m` znajduje się definicja funkcji obliczającej splot 2 sygnałów - powinna ona funkcjonować dokładnie jak wbudowana funkcja `conv`. W pliku `convolution.m` jest wywołanie funkcji `sig_conv` dla impulsu prostokątnego i funkcji wykładniczej. Ten sam efekt możnaby osiągnąć wywołując funkcję wbudowaną:
```
convolution_result = conv(signal1, signal2);
```

Na samym końcu pliku `convolution.m` znajduje się porównanie obu sygnałów i ich splotu:
![plot_convolution](https://github.com/nuenen313/przetwarzanie-sygnalow-lab/assets/129689130/790a03d5-4ef5-4b9c-8a08-2b3735b86500)
poprzez wykorzystanie funkcji `subplot()` pozwalającej na dzielenie okna graficznego. Można też pokazać oba sygnały i splot na jednym wykresie, pamiętając o tym, że wynik działania funkcji `sig_conv` ma inny rozmiar niż oryginalne sygnały i wektor `time` (więc trzeba stworzyć nowy wektor z wartościami czasu dla splotu):
```
convolution_result = sig_conv(rect_pulse, exponential);
time_conv = linspace(time(1), time(end), length(convolution_result));

figure
plot(time, rect_pulse, '-r');
hold on;
plot(time, exponential, '-b');
plot(time_conv, convolution_result, '-k');
hold off;
```
Ale przez przeskalowanie wyniku splotu w stosunku do oryginalnych sygnałów jest to mało czytelne, także nie polecam.

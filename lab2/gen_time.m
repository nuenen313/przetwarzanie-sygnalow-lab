% funkcja, która na podstawie podanej liczby próbek N i częstotliwości
% próbkowania fs generuje jednowymiarową tablicę zawierającą czasy 
% kolejnych próbek, przy czym czas pierwszej próbki powinien wynosić 0

function time = gen_time(N, fs)
    time = zeros(1, N);
    time(1) = 0;
    for i = 2:N
        time(i) = (i-1)/fs;
    end
end
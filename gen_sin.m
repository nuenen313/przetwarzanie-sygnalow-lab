% funkcja, która na podstawie wygenerowanej tabeli z czasami próbek time
% generuje tabelę z przebiegiem sinusoidalnym o częstotliwości fsin, 
% amplitudzie A i przesunięciu fazowym fi

function signal = gen_sin(time, fsin, A, fi)
    signal = A*sin(2*pi*fsin*time + fi); % zakładając jednostkę fi [Hz]
end
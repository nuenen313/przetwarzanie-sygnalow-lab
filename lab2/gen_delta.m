% funkcja, która na podstawie tabeli z czasem próbek generuje deltę
% Kroeneckera
function signal = gen_delta(time)
    N = length(time);
    signal = zeros(1, N);
    signal(1) = 1;
end
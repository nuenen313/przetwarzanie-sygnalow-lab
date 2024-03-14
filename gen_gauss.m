% funkcja, która na podstawie tabeli z czasem próbek time generuje impuls
% Gaussa, którego środek przypada na czas u, a szerokość opisano
% parametrem s
function signal = gen_gauss(time, u, s)
    N = length(time);
    signal = zeros(1, N);
    for n=1:N
        signal(n) = exp((-(time(n) - u)^2)/(2*s^2));
    end
end
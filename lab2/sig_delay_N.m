% funkcja, która opóźnia sygnał x o Nd próbek
function y = sig_delay_N(x, Nd)
    N = length(x);
    y = zeros(1, N);
    for i=1:N-Nd
        y(i+Nd) = x(i);
    end
end
% funkcja, która na podstawie tabeli z czasem próbek time generuje impuls 
% trójkątny o amplitudzie A, czasie narostu tr i czasie opadania tf
function signal = gen_triangle(time, A, tr, tf)
    N = length(time);
    signal = zeros(1, N);
    for n=1:N
        if time(n) < tr % jeżeli trwa narost
            signal(n) = A*time(n)/tr;
        elseif time(n) <= tr+tf % jeżeli trwa spadek
            signal(n) = A - A*(time(n) - tr)/tf;
        else
            signal(n) = 0;
        end
    end
end
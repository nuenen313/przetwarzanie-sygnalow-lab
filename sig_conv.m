% funkcja, która oblicza wartość splotu dwóch sygnałów x i y
function z = sig_conv(x,y)
    Nx = length(x);
    Ny = length(y);
    z = zeros(1, Nx + Ny -1);
    for n =1:Nx+Ny-1
        c = 0;
        for k=1:Ny
            if ((n - k + 1 >= 1) && (n - k + 1<= Nx))
                c = c + x(n - k + 1)*y(k);
            end
        end
        z(n) = c;
    end
end
function ui = uinit(x, ictype)
   %% Definir las Posibles Condiciones Iniciales
    if(ictype == 1)
        %% 1ra Condición Inicial
        ui = exp(-2 * (x - 1) .^ 2);
    elseif(ictype == 2)
        %% 2da Condición Inicial
        for i = 1:length(x)
            if(x(i) < 0)
                ui(i) = 1;
            elseif(0 <= x(i) && x(i) <= 1)
                ui(i) = 1 - x(i);
            elseif(x(i) > 1)
                ui(i) = 0;
            end
        end
    elseif(ictype == 3)
        %% 3ra Condición Inicial
        for i = 1:length(x)
            if(x(i) < 0)
                ui(i) = 0;
            elseif(0 <= x(i) && x(i) <= 1)
                ui(i) = x(i);
            elseif(x(i) > 1)
                ui(i) = 1;
            end
        end
    end
end
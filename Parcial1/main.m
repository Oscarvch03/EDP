
clc
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Definir los Parámetros para el Método Numérico de Discretización

x_end = 2;
t_end = 2;

J = 100;
N = 100;

dx = x_end / J;
dt = t_end / N;

x = 0:dx:x_end;
t = 0:dt:t_end;


%% Definir la Condición Inicial a Considerar

ictype = 3;
u0 = uinit(x, ictype);


%% Iteraciones del Método Numérico

u = u0;
unew = 0 * u;
f = @(x) (1/2) * x .^ 2;

for i = 1:N
    unew(2:end) = u(2:end) - (dt/dx) * (f(u(2:end)) - f(u(1:end - 1)));
    unew(1) = u(1);
    u = unew;
    U(i, :) = u(:);
end
U = [u0; U];


%% Plotear la Solución Obtenida

figure(1)
surf(x, t, U)
shading interp
title('3ra Condición Inicial')
xlabel('x')
ylabel('t')
zlabel('u(x, t)')
grid on
colormap cool

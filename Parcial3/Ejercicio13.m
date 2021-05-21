clc
clear all


%% Parametros del Problema
c = 0.4;
l = 1;

H = @(x) x + ((x - x.^4) ./ (12 * c^2));
x = 0:0.001:l;
t = 20 .* x;
k = 50;


%% Solucion del Problema
V = VideoWriter("Ejercicio13_c" + string(c) + ".mp4");
video.FrameRate = 100;
open(V);

figure(1)
xlim([0, l])
ylim([0, 1.4*l])
grid on
xlabel('x')
ylabel('u(x, t)')
title("Solucion u(x, t) = v(x, t) + H(x), c = " + string(c))
% set(gcf,'Position',[200 200 1000 1000])
hold on


%% Solucion u(x, t) = v(x, t) + H(x)
for i = 1:length(t)
    v_i = zeros(1, length(x));
    for n = 1:k
        a_n = ((2 * (pi^2) * ((-1)^n) * (n^2)) - (4 * ((-1)^n)) + 4) / ((pi^5) * (c^2) * (n^5));
        v_i = v_i + (a_n .* sin((n * pi) .* x) .* cos(n * pi * t(i)));
    end
    u_i = v_i + H(x);
    plot(x, u_i, 'r', 'LineWidth', 2)
    if(i == 1)
        pause(3)
    end
    F = getframe(gcf);
    writeVideo(V, F);
    if(i ~= length(t))
        cla
    end
end
close(V);


%% Superficie de la Solucion
figure(2)
x = 0:0.04:l;
t = 20 .* x;
[X, T] = meshgrid(x, t);
U = zeros(length(x), length(t));
for n = 1:k
    a_n = ((2 * (pi^2) * ((-1)^n) * (n^2)) - (4 * ((-1)^n)) + 4) / ((pi^5) * (c^2) * (n^5));
    U = U + (a_n .* sin((n * pi) .* X) .* cos(n * pi .* T));
end
U = U + H(X);
surf(X, T, U)
grid on
xlabel('x')
ylabel('t')
zlabel('u(x, t)')
title("Superficie Solucion u(x, t) = v(x, t) + H(x), c = " + string(c))
colormap cool
saveas(gcf, "surf_c" + string(c) + ".png")

clc
clear all

c = 3;

x = 0:0.02:pi;
t = 10 .* x;

% V = VideoWriter('Ejercicio27_04_2021.mp4');
% video.FrameRate = 100;
% open(V);
% 
% figure(1)
% xlim([-0.4, 3.5])
% ylim([-1, 1])
% grid on
% xlabel('t')
% ylabel('u(x, t)')
% title('Solucion u(x, t)')
% % set(gcf,'Position',[200 200 1000 1000])
% hold on
% 
% for i = 1:length(t)
%    y = (3/4) .* sin(x) .* cos(t(i)) + (1/2) .* sin(2 .* x) .* sin(2 * t(i)) - (1/4) .* sin(3 .* x) .* cos(3 * t(i));
%    plot(x, y, 'r')
%    if(i == 1)
%        pause(3)
%    end
%    F = getframe(gcf);
%    writeVideo(V, F);
%    if(i ~= length(t))
%        cla
%    end
% end
% 
% close(V);

figure(2)
[X, T] = meshgrid(x, t);
U = (3/4) .* sin(X) .* cos(T) + (1/2) .* sin(2 .* X) .* sin(2 .* T) - (1/4) .* sin(3 .* X) .* cos(3 .* T);
surf(X, T, U)
xlabel('x')
ylabel('t')
zlabel('u(x, t)')
colormap cool
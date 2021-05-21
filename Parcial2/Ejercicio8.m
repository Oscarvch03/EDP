clc
clear all

c = 3;

x = 0:0.01:15;
t = 0:0.005:3.5;

V = VideoWriter('Ejercicio8.mp4');
video.FrameRate = 100;
open(V);

figure(1)
xlim([-1, 15])
ylim([-2, 1000])
grid on
xlabel('x')
ylabel('u(x, t)')
title({'Ejercicio 8: t = 0', 'u(x, t) = (1/24)((x+3t)^4 + (3t-x)^4),  x < 3t'})
set(gcf,'Position',[200 200 1000 1000])
hold on

for i = 1:length(t)
   y = (1/24) * ((x + 3 .* t(i)) .^ 4 + (3 .* t(i) - x) .^ 4);
   plot([0, 0], [-3, 1001], 'k', 'LineWidth', 5)
   plot(0, y(1),'r','Marker','.','MarkerSize', 35)
   plot(x, y, 'r')
   title({"Ejercicio 8: t = " + num2str(t(i)), 'u(x, t) = (1/24)((x+3t)^4 + (3t-x)^4),  x < 3t'})
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
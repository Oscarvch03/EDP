clc
clear all

x = 0:0.01:20;
t = 0:0.01:20;

V = VideoWriter('Ejemplo.mp4');
video.FrameRate = 100;
open(V);

figure(1)
xlim([-1, 20])
ylim([-2, 2])
grid on
xlabel('x')
ylabel('u(x, t)')
title('Ejemplo: u(x, t) = cos((pi/2)x)cos((pi/2)t),  t = 0')
set(gcf,'Position',[200 200 1000 1000])
hold on

for i = 1:length(t)
   y = cos((pi/2) .* x) .* cos((pi/2) * t(i));
   plot([0, 0], [-3, 3], 'k', 'LineWidth', 5)
   plot(0, y(1),'r','Marker','.','MarkerSize', 35)
   plot(x, y, 'r')
   title("Ejemplo: u(x, t) = cos((pi/2)x)cos((pi/2)t),  t = " + num2str(t(i)))
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
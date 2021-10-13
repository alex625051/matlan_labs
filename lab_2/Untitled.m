clc;
clear;

circle_points_number=16;
circle_R = 60;
x0=40;y0=60;

for i=1:circle_points_number
    x = cos(2 * pi * i / circle_points_number) * circle_R + x0;    
    y= sin(2 * pi * i / circle_points_number) * circle_R + y0;
        figure(1);
        plot(x,y,'r*','MarkerSize',8);
        hold on;
        grid on;
end;


        
        figure(1);
        xlabel('x');
        ylabel('y');
        title('xy');
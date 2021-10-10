clc;
clear;
path='C:\Users\adminNew\Desktop\modelirovanie\';

%входные параметры
delta_t = 0.001; %шаг по времени
N = 1000;%временнџе точки
t = (N+1);

%начальные точки кривых дл€ построени€
E = -3;
G = 12;

%координаты точки устойчивости
xn = 6;
yn = -1.5;

%решение по времени
t(1) = 0;
for i=1:N
    t(i+1) = t(i)+delta_t;
end

%начальные значени€ 
x = (N+1);
y = (N+1);

%«начени€ дл€ построени€ кривых
for j=1:4
    for n=E:G
        switch j
            %в зависимости от услови€ получаем координаты
            case 1
            x(1) = n;
            y(1) = G;
            case 2
            x(1) = G;
            y(1) = n;
            case 3
            x(1) = n;
            y(1) = E;
            case 4
            x(1) = E;
            y(1) = n;
        end
        
        % численное решение по не€вной схеме Ёйлера
        for i=2:N+1
            x(i) = (x(i-1)-6*delta_t)/(1-delta_t);
            y(i) = (y(i-1)+3*delta_t)/(1-2*delta_t);
        end
        
        %построение кривых
        figure(1);
        plot(t(1:N+1),x(1:N+1));
        hold on;
        grid on;
        
        figure(2);
        plot(t(1:N+1),y(1:N+1));
        hold on;
        grid on;
        
        figure(3);
        plot(x(1:N+1),y(1:N+1));
        hold on;
        grid on;
    end
end

%Ћегенда и тайтл
figure(1);
xlabel('t');
ylabel('x1');
title('ƒинамика системы по x1');
saveas(gcf,strcat(path,'lab1_x1_ot_t.jpg'));

figure(2);
xlabel('t');
ylabel('x2');
title('ƒинамика системы по x2');
saveas(gcf,strcat(path,'lab1_x2_ot_t.jpg'));
figure(3);
xlabel('x1');
ylabel('x2');
plot(xn,yn,'r*','MarkerSize',8);% маркировка стационарной тиочки на фазовом портрете
title('‘азовый портрет системы');
saveas(gcf,strcat(path,'lab1_phas_portret.jpg'));
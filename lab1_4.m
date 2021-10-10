clc;
clear;
path='C:\Users\adminNew\Desktop\modelirovanie\';
lab='lab_1_4_';

%входные параметры
k=1;
b=5;
q=0;
nu1=5.5;
nu2=7.5;
d=5;
delta_t = 0.01; %шаг по времени
N = 5000;%временнџе точки
t = (N+1);

%начальные точки кривых дл€ построени€
E = -6;
G = 10;

%координаты точки устойчивости
mu1n = 5;
mu0n = 2.5;

%решение по времени
t(1) = 0;
for i=1:N
    t(i+1) = t(i)+delta_t;
end

%начальные значени€ 
mu0 = (N+1);
mu1 = (N+1);
mu0(1) = 0;
mu1(1) = 0;

%«начени€ дл€ построени€ кривых
for j=1:4
    for n=E:G
        switch j
            %в зависимости от услови€ получаем координаты
            case 1
                M0_pol(1) = n;
                M1_pol(1) = G;
                mu0(1) = n;
                mu1(1) = G;
            case 2
                M0_pol(1) = G;
                M1_pol(1) = n;
                mu0(1) = G;
                mu1(1) = n;
            case 3
                M0_pol(1) = n;
                M1_pol(1) = E;
                mu0(1) = n;
                mu1(1) = E;
            case 4
                M0_pol(1) = E;
                M1_pol(1) = n;
                mu0(1) = E;
                mu1(1) = n;
        end
        
        % численное решение по €вной схеме Ёйлера
        for i=2:N+1
            M0_pol = mu0(i-1) + delta_t * (k*mu1(i-1) - b + q);
            M1_pol = mu1(i-1) + delta_t * (mu0(i-1)*(nu1-nu2) + d);
            mu0(i) = mu0(i-1) + delta_t * ((k*mu1(i-1) - b + q) + (k*M1_pol - b + q))/2;
            mu1(i) = mu1(i-1) + delta_t * ((mu0(i-1)*(nu1-nu2) + d) + (M0_pol*(nu1-nu2) + d))/2;

        end
        
        %построение кривых
        figure(1);
        plot(t(1:N+1),mu0(1:N+1));
        hold on;
        grid on;
        
        figure(2);
        plot(t(1:N+1),mu1(1:N+1));
        hold on;
        grid on;
        
        figure(3);
        plot(mu0(1:N+1),mu1(1:N+1));
        hold on;
        grid on;
    end
end

%Ћегенда и тайтл
figure(1);
xlabel('t');
ylabel('mu0');
title('ƒинамика системы по mu0');
saveas(gcf,strcat(path,lab,'mu0_ot_t.jpg'));

figure(2);
xlabel('t');
ylabel('mu1');
title('ƒинамика системы по mu1');
saveas(gcf,strcat(path,lab,'mu1_ot_t.jpg'));
figure(3);
xlabel('mu0');
ylabel('mu1');
plot(mu0n,mu1n,'r*','MarkerSize',8);% маркировка стационарной точки на фазовом портрете
title('‘азовый портрет системы');
saveas(gcf,strcat(path,lab,'phas_portret.jpg'));
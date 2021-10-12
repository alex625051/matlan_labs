clc;
clear;
path='';
lab='lab_1_5_';

%входные параметры
delta_t = 0.001; %шаг по времени
N = 5000;%временнџе точки
t = (N+1);

%начальные точки кривых дл€ построени€
E = -10;
G = 10;

%координаты точки устойчивости
xn = 0;
yn = 4;

%решение по времени
t(1) = 0;
for i=1:N
    t(i+1) = t(i)+delta_t;
end

%начальные значени€ 
x1 = (N+1);
pre_x1 = (N+1);
x2 = (N+1);
pre_x2 = (N+1);

%«начени€ дл€ построени€ кривых
for j=1:4
    for n=E:G
        switch j
            %в зависимости от услови€ получаем координаты
            case 1
                x1(1) = n;
                x2(1) = G;
                pre_x1(1)= n;
                pre_x1(1)=G ;
                
              
            case 2
                x1(1) = G;
                x2(1) = n;
                pre_x1(1)= G;
                pre_x1(1)=n ;
            
            case 3
                x1(1) = n;
                x2(1) = E;
                pre_x1(1)= n;
                pre_x1(1)=E ;
           
            case 4
                x1(1) = E;
                x2(1) = n;  
                pre_x1(1)= E;
                pre_x1(1)=n ;                
        end
        
        % численное решение по полу€вной схеме Ёйлера
        for i=1:N
            %  pre_x1(i+1)=( 2*delta_t*(4-x2(i))+x1(i) ) / (1+2*delta_t);
            %  pre_x2(i+1) = (3*delta_t*(x2(i) + 4)+x2(i)) / (1+3*delta_t);    
            %  x2(i+1)=(3*delta_t*(pre_x1(i) + 4)+x2(i)) / (1+3*delta_t);
            %  x1(i+1)=(2*delta_t*(4-pre_x2(i))+x1(i))/(1+2*delta_t);
           
          % x1(i+1) = x1(i) + (-2*x1(i) - 2*x2(i)+8)*delta_t   ;
          % x2(i+1) = x2(i) +(3*x1(i+1) - 3*x2(i)+12)*delta_t;
            
        %    x2(i+1)=(3*delta_t*(x1(i) + 4)+x2(i)) / (1+3*delta_t);
        %    x1(i+1)=(2*delta_t*(4-x2(i))+x1(i))/(1+2*delta_t);
           
           pre_x1(i+1) = x1(i) + (-2*x1(i) - 2*x2(i)+8)*delta_t   ;
           pre_x2(i+1) = x2(i) +(3*x1(i) - 3*x2(i)+12)*delta_t;
           
           x1(i+1) = x1(i) + (-2*x1(i) - 2*pre_x2(i+1)+8)*delta_t   ;
           x2(i+1) = x2(i) +(3*pre_x1(i+1) - 3*x2(i)+12)*delta_t;
        end
        
        %построение кривых
        figure(1);
        plot(t(1:N+1),x1(1:N+1));
        hold on;
        grid on;
        
        figure(2);
        plot(t(1:N+1),x2(1:N+1));
        hold on;
        grid on;
        
        figure(3);
        plot(x1(1:N+1),x2(1:N+1));
        hold on;
        grid on;
    end
end

%Ћегенда и тайтл
figure(1);
xlabel('t');
ylabel('x1');
title('ƒинамика системы по x1');
saveas(gcf,strcat(path,lab,'x1_ot_t.jpg'));

figure(2);
xlabel('t');
ylabel('x2');
title('ƒинамика системы по x2');
saveas(gcf,strcat(path,lab,'x2_ot_t.jpg'));
figure(3);
xlabel('x1');
ylabel('x2');
plot(xn,yn,'r*','MarkerSize',8);% маркировка стационарной точки на фазовом портрете
title('‘азовый портрет системы');
saveas(gcf,strcat(path,lab,'phas_portret.jpg'));
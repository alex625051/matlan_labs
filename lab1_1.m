clc;
clear;
path='C:\Users\adminNew\Desktop\modelirovanie\';

%������� ���������
x0 = 15;
k1 = 1;
k2 = 2;
tau = 1;
delta_t = 0.01; %��� �� �������
N = tau/delta_t*2;%��������� �����
t = (N+1);

%��������� ����� ������ ��� ����������
E = 0;
G = 10;

%���������� ����� ������������
xn = 7.5;
yn = 2.5;

%������� �� �������
t(1) = 0;
for i=1:N
    t(i+1) = t(i)+delta_t;
end

%��������� �������� 
x = (N+1);
y = (N+1);

%�������� ��� ���������� ������
for j=1:4
    for n=E:G
        switch j
            %� ����������� �� ������� �������� ����������
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
        
        % ��������� ������� �� ����� ����� ������
        for i=1:N
            x(i+1) = x(i) + (delta_t/tau)*(x0 - x(i)) - delta_t*k1*x(i);
            y(i+1) = y(i) - (delta_t/tau)*y(i) + delta_t*k1*x(i) - delta_t*k2*y(i);
        end
        
        %���������� ������
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

%������� � �����
figure(1);
xlabel('t');
ylabel('x');
title('�������� ������� �� x');
saveas(gcf,strcat(path,'lab1_x_ot_t.jpg'));

figure(2);
xlabel('t');
ylabel('y');
title('�������� ������� �� y');
saveas(gcf,strcat(path,'lab1_y_ot_t.jpg'));
figure(3);
xlabel('x');
ylabel('y');
plot(xn,yn,'r*','MarkerSize',8);% ���������� ������������ ������ �� ������� ��������
title('������� ������� �������');
saveas(gcf,strcat(path,'lab1_phas_portret.jpg'));
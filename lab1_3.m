clc;
clear;
path='C:\Users\adminNew\Desktop\modelirovanie\';
lab='lab_1_3_';

%������� ���������
delta_t = 0.001; %��� �� �������
N = 1000;%��������� �����
t = (N+1);

%��������� ����� ������ ��� ����������
E = -6;
G = 6;

%���������� ����� ������������
xn = 0;
yn = -3;

%������� �� �������
t(1) = 0;
for i=1:N
    t(i+1) = t(i)+delta_t;
end

%��������� �������� 
x = (N+1);
y = (N+1);
x(1) = 0;
y(1) = 0;

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
        
        % ��������� ������� �� ������� ����� ������
        for i=2:N+1
            x(i) = (x(i-1))/(1+4*delta_t);
            y(i) = (y(i-1)+3*delta_t)/(1-delta_t);
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
ylabel('x1');
title('�������� ������� �� x1');
saveas(gcf,strcat(path,lab,'x1_ot_t.jpg'));

figure(2);
xlabel('t');
ylabel('x2');
title('�������� ������� �� x2');
saveas(gcf,strcat(path,lab,'x2_ot_t.jpg'));
figure(3);
xlabel('x1');
ylabel('x2');
plot(xn,yn,'r*','MarkerSize',8);% ���������� ������������ ����� �� ������� ��������
title('������� ������� �������');
saveas(gcf,strcat(path,lab,'phas_portret.jpg'));
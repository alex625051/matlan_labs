clc;
clear;
path='';
lab='lab_1_6_';

% ���������� ������� ����� � ������ ������ ����� ������������
circle_points_number=16;
circle_R = 100;

%������� ���������
delta_t = 0.001; %��� �� �������
% N = 2^(round(log2(5000)))-1; % ��� ����� N ��� power of 2
N=5000;
%��������� �����
t = (N+1);
t(1) = 0;
for i=1:N
    t(i+1) = t(i)+delta_t;
end

%���������� ����� ������������
xS = 0;
yS = 4;


%��������� �������� 
x1 = (N+1);
x2 = (N+1);

%�������� ��� ���������� ������
for circ_point=1:circle_points_number
        x1(1) = cos(2 * pi * circ_point / circle_points_number) * circle_R + xS;    
        x2(1)= sin(2 * pi * circ_point / circle_points_number) * circle_R + yS;
        figure(3);
        plot(x1(1),x2(1),'b*','MarkerSize',3);
        hold on;
        grid on;
                
        
        
        % ��������� ������� �� ��������� ����� ������
        for i=1:N
                x2(i+1)=(x2(i) + delta_t*(3*x1(i) -10) )/(1-delta_t);
                x1(i+1) = (x1(i) - 3*x2(i))*delta_t + x1(i);
        end
        

        %���������� ������
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
        
                figure(4);
        plot3(x1,x2,t);
        hold on
        grid on;
end

%������� � �����
figure(1);
xlabel('t');
ylabel('x1');
title('�������� ������� �� x1');
hold off;

figure(2);
xlabel('t');
ylabel('x2');
title('�������� ������� �� x2');
hold off;

figure(3);
xlabel('x1');
ylabel('x2');
plot(xS,yS,'r*','MarkerSize',12);% ���������� ������������ ����� �� ������� ��������
title('������� ������� �������');
hold off;

figure(4);
xlabel('x1');
ylabel('x2');
zlabel('t');
hold off;





title('�������� ������� �� x2');
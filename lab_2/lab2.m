clc;
clear;
path='';
lab='lab_2_';

% ���������� ������� ����� � ������ ������ ����� ������������
circle_points_number=15;
% circle_R = 6;
scr_limit=[-10 10];

%������� ���������
delta_t = 0.000005; %��� �� �������
N=200000;
e1 = 1.5; sigma1 = 1; a1 =0.5;   e2 = 2; sigma2 = 0.5; a2 =1.5;
% e1 = 1; sigma1 = 1; a1 =1;   e2 = 0.75; sigma2 = 1; a2 =0.5;
%��������� �����
t = (N+1);
t(1) = 0;
for i=1:N
    t(i+1) = t(i)+delta_t;
end

%���������� �����
xS1 = 0;
yS1 = 0;
xS2 = 0;
yS2 = e2/sigma2;%4
xS3 = e1/sigma1;%1.5
yS3 = 0;
xS4 = (a1*e2-sigma2*e1)/(a2*a1-sigma2*sigma1);%=1
yS4 = e2/sigma2;%=4
xSa=[xS1,xS2,xS3,xS4];
ySa=[yS1,yS2,yS3,yS4];
Ra=[3,6,10,10]; % �������������� ������� ��������� ������� ��� ������� ���� �����

po_col=['r*','r*','r*','r*'];

%����� ������
for ind=1:4
    figure(ind);
    hold on;
    grid on;
end



for sp=1:1
    clear x1;
    clear x2;
    fprintf('����� ��� ����� %d started\n',sp);
    xS = xSa(sp);
    yS = ySa(sp);
    colo=po_col(sp);
    %���������� �������
    
    for ind=1:4
        figure(sp*4+ind)
        hold on;
        grid on;
    end
    figure(3);           
    plot(xS,yS,'r*','MarkerSize',12);% ���������� ������������ ����� �� ������� ��������



    %��������� �������� 
    x1 = (N+1);
    x2 = (N+1);
    circle_R=Ra(sp);
    %�������� ��� ���������� ������
    for circ_point=1:circle_points_number
            x1(1) = cos(2 * pi * circ_point / circle_points_number) * circle_R + xS;    
            x2(1)= sin(2 * pi * circ_point / circle_points_number) * circle_R + yS;
            figure(3);
            plot(x1(1),x2(1),'b*','MarkerSize',3);
            figure(sp*4+3);
            plot(x1(1),x2(1),'b*','MarkerSize',3);




            % ��������� ������� �� ����� ����� ������
            for n=1:N
                    x1(n+1) = x1(n)*(delta_t*(e1-sigma1*x1(n)-a1*x2(n)) + 1);
                    x2(n+1) = x2(n)*(delta_t*(e2-sigma2*x2(n)-a2*x1(n))+1);

            end


            %���������� ������
            figure(1);
            plot(t(1:n),x1(1:n));            
            figure(sp*4+1);
            plot(t(1:n),x1(1:n));

  

            figure(2);
            plot(t(1:n),x2(1:n));           
            figure(sp*4+2);
            plot(t(1:n),x2(1:n));

            figure(3);           
            plot(x1(1:n),x2(1:n));
            plot(xS,yS,'r*','MarkerSize',12);% ���������� ������������ ����� �� ������� ��������        
            figure(sp*4+3);
            plot(x1(1:n),x2(1:n));
            plot(x1(1),x2(1),'b*','MarkerSize',3);


            figure(4);
            plot3(x1(1:n),x2(1:n),t(1:n));
            figure(sp*4+4);
            plot3(x1(1:n),x2(1:n),t(1:n));

    end
    Ux=sprintf('%.2f', xS);
    Uy=sprintf('%.2f', yS);
    sp_string=int2str(sp);
    figure(sp*4+1);
    xlabel('t');
    ylabel('x1');
    ylim(scr_limit)
    title(strcat('�������� ������� �� x1',' � ����� ����� ',sp_string,' u=(',Ux,',',Uy,')'));
    hold off;

    figure(sp*4+2);
    ylim(scr_limit)
    xlabel('t');
    ylabel('x2');
    title(strcat('�������� ������� �� x2',' � ����� ����� ',sp_string,' u=(',Ux,',',Uy,')'));
    hold off;

    figure(sp*4+3);
    ylim(scr_limit)
    xlim(scr_limit)
    xlabel('x1');
    ylabel('x2');
    plot(xS,yS,'r*','MarkerSize',12);% ���������� ������������ ����� �� ������� ��������        
    title(strcat('������� ������� �������',' � ����� ����� ',sp_string,' u=(',Ux,',',Uy,')'));
    hold off;

    figure(sp*4+4);
    ylim(scr_limit)
    xlim(scr_limit)
    title(strcat('������� �� ������� t',' � ����� ����� ',sp_string,' u=(',Ux,',',Uy,')'));
    xlabel('x1');
    ylabel('x2');
    zlabel('t');
    hold off;
    
    fprintf('����� ��� ����� %d completed. last x,y=%d,%d, first x,y=%d,%d\n\n',sp,x1(n),x2(n),x1(1),x2(1));

end

%������� � �����
figure(1);
xlabel('t');
ylabel('x1');
ylim(scr_limit)
title('�������� ������� �� x1');
hold off;

figure(2);
ylim(scr_limit)
xlabel('t');
ylabel('x2');
title('�������� ������� �� x2');
hold off;

figure(3);
ylim(scr_limit)
xlim(scr_limit)
xlabel('x1');
ylabel('x2');
title('������� ������� �������');
hold off;

figure(4);
ylim(scr_limit)
xlim(scr_limit)
title('������� �� ������� t');
xlabel('x1');
ylabel('x2');
zlabel('t');
hold off;








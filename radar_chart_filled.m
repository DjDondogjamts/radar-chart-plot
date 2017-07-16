%%% Radar Chart
close all
clear all
clc

%Name the categories
categ = char('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H');

filename='/Users/jythomaskim/Documents/MATLAB/Data/Hybrid Machine Eval/170516.xlsx';
sheet=3;
range='C2:J16';
data=xlsread(filename,sheet,range);
[~,txt]=xlsread(filename,sheet,'B2:B16');

dim=size(data,2);          %set dimension or 'verteces'
R=max(max(data));

data_num=size(data,1);
dat=zeros(data_num,dim+1);
dat=data;
dat(:,dim+1)=data(:,1);    %connect last point to 1st


t = (2*pi/dim);
theta = pi/2:-t:pi/2-2*pi;  %set zero at 12o'clock, clockwise direction
theta2 =0:0.01:2*pi;
k=1;

for i= 9:15           %AM processes (row 9 to 15)
    for j= 1:8     %SM processes (row 1 to 8)

        fig=figure(k);
%drawing radar axis
        circle(0,0,1,theta2)
        axis equal
        axis off
        hold on
        circle(0,0,2,theta2)
        circle(0,0,3,theta2)
        circle(0,0,4,theta2)
        circle(0,0,5,theta2)
        radialline(0,5)
        radialline(t*1,5)
        radialline(t*2,5)
        radialline(t*3,5)
        radialline(t*4,5)
        radialline(t*5,5)
        radialline(t*6,5)
        radialline(t*7,5)
        radialline(t*8,5)
%         Rtext=['0','1','2','3','4','5'];
%         text([0 0],[0 1],[0 2],[0 3],[0 4],[0 5],Rtext);
        text(-.2,0,'0','HorizontalAlignment','right','FontSize',20);
        text(-.2,1,'1','HorizontalAlignment','right','FontSize',20);
        text(-.2,2,'2','HorizontalAlignment','right','FontSize',20);
        text(-.2,3,'3','HorizontalAlignment','right','FontSize',20);
        text(-.2,4,'4','HorizontalAlignment','right','FontSize',20);
        text(-.2,5,'5','HorizontalAlignment','right','FontSize',20);
        [xa,ya]=pol2cart(pi/2,5.5);
        [xb,yb]=pol2cart(pi/4,5.5);
        [xc,yc]=pol2cart(0,5.5);
        [xd,yd]=pol2cart(-pi/4,5.5);
        [xe,ye]=pol2cart(-pi/2,5.5);
        [xf,yf]=pol2cart(-3*pi/4,5.5);
        [xg,yg]=pol2cart(pi,5.5);
        [xh,yh]=pol2cart(3*pi/4,5.5);
        text(xa,ya,'A','HorizontalAlignment','center','FontSize',20);
        text(xb,yb,'B','HorizontalAlignment','center','FontSize',20);
        text(xc,yc,'C','HorizontalAlignment','center','FontSize',20);
        text(xd,yd,'D','HorizontalAlignment','center','FontSize',20);
        text(xe,ye,'E','HorizontalAlignment','center','FontSize',20);
        text(xf,yf,'F','HorizontalAlignment','center','FontSize',20);
        text(xg,yg,'G','HorizontalAlignment','center','FontSize',20);
        text(xh,yh,'H','HorizontalAlignment','center','FontSize',20);
%conversion of coordinates        
        hold on
        [x1,y1]=pol2cart(theta,dat(j,:));
        [x2,y2]=pol2cart(theta,dat(i,:));
%plotting
        h1=fill(x1,y1,'b');
        set(h1,'facealpha',0.2,'edgecolor','none');
        hold on
        h2=fill(x2,y2,'r');
        set(h2,'facealpha',0.2,'edgecolor','none');
        hold on
%legend        
        blue=char(strcat('\color{blue} ',txt(j,1)));
        red=char(strcat('\color{red} ',txt(i,1)));
        lg=legend([h1 h2],blue,red,'Location','southoutside','Box','off','Color','none');
        set(lg,'FontSize',20);
%save file
        path='/Users/jythomaskim/Desktop/radarchart';
        saveas(fig,fullfile(path,sprintf('%d',k)),'jpg');
        close all
        k=k+1;
    end
end



        
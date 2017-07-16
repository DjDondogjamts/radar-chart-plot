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

% i=0;
% t=1;
% dat2=ones(data_num,9);
% for k=1:1%data_num
%     while max(dat2(k,t:t+7))~=0
%         dat2(k,t:t+8)=dat(k,:)-0.1*i;
%         i=i+1;
%         t=t+8;
%     end
% end
% dat2(1,:)

t = (2*pi/dim);
theta = 0:t:2*pi;

k=1;

for i= 9:15           %AM processes (row 9 to 15)
    for j= 1:8     %SM processes (row 1 to 8)
       

        fig=figure(k);
        p1=polarplot(theta,dat(j,:),'b','Linewidth',2);
        hold on
        p2=polarplot(theta,dat(i,:),'r','Linewidth',2);
        hold on 
       
%         hyb=polarplot(theta,max(dat(j,:),dat(i,:)),'g:','Linewidth',4);
%         hyb.Color(4)=0.7;

        ax=gca;
        ax.GridAlpha=1;
        ax.GridColor='k';
%         ax.MinorGridColor='k';
        ax.ThetaColor='k';
        ax.RColor='k';
%         ax.RAxis.Color='k';
        ax.RAxisLocation=90;
        ax.RLim=[0 R];
        ax.ThetaZeroLocation='top';
        ax.ThetaDir='clockwise';
        ax.ThetaTick=[0:360/dim:360];
        ax.ThetaTickLabel={categ};
        ax.FontSize=20;
        ax.FontWeight='bold';
        blue=char(strcat('\color{blue} ',txt(j,1)));
        red=char(strcat('\color{red} ',txt(i,1)));
        legend(blue,red,'Location','southoutside')
       
%         [x,y]=pol2cart(theta,dat(j,:));
%         f=fill(x,y,'r');
        
        path='/Users/jythomaskim/Desktop/radarchart';
        saveas(fig,fullfile(path,sprintf('%d',k)),'jpg');
        close all
        k=k+1;
    end
end



        
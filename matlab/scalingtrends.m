%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fscalingtrends.m
%% Description:   
%% Author:        Carsten Wulff <wulff@iet.ntnu.no>
%% Created at:    Thu Jun 26 10:29:08 2008
%% Modified at:   Thu Jun 26 10:40:24 2008
%% Modified by:   Carsten Wulff <wulff@iet.ntnu.no>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
data = load('../scalingtrends.prn');


plot(data(:,2), data(:,3),'DisplayName','Output','LineWidth',5,'Color',[0 0 0],'Marker','x');
set(gca,'XDir','reverse');
xlabel('DRAM 1/2 pitch');
ylabel('Supply voltage');
font=16
set(get(gca,'Title'),'FontName','Arial','FontWeight','Bold', ...
		  'FontSize',font)
set(gca,'FontName','Arial','FontSize',font,'FontWeight','Bold')
set(get(gca,'Ylabel'),'FontWeight','Bold','FontSize',font)
set(get(gca,'Xlabel'),'FontWeight','Bold','FontSize',font)
set(gcf,'Color','White');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fctdt.m
%% Description:   
%% Author:        Carsten Wulff <wulff@iet.ntnu.no>
%% Created at:    Tue Dec  2 14:07:18 2008
%% Modified at:   Tue Dec  2 14:51:09 2008
%% Modified by:   Carsten Wulff <wulff@iet.ntnu.no>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 1000;
ts = 1/N;
LSB = 19;
t = (1:N)*ts;
tsamp = 50;
amplitude = 50;
linewidth=5;

%Continuous time continuous value
xctcv = amplitude*(sin(2*pi*1*t/N/ts));
figure(1);
plot(t,xctcv,'r','LineWidth',linewidth);
xlabel('Time [s]');
ylabel('Current [uA]');
adorne


%Discrete time , continuous value
samples = (1:tsamp:N);
xdtcv = xctcv(samples);
tdt = t(samples);
figure(2);
plot(tdt,xdtcv,'bx','LineWidth',linewidth);
xlabel('Time [s]');
ylabel('Current [uA]');
adorne

%Continuous time, discrete value
samples = (1:tsamp:N);
xctdv = round(xctcv/LSB)*LSB;
figure(3);
stairs(t,xctdv,'LineWidth',linewidth);
xlabel('Time [s]');
ylabel('Current [uA]');
adorne

%Discrete time, discrete value
samples = (1:tsamp:N);
xctdv = round(xdtcv/LSB)*LSB;
figure(4);
plot(tdt,xctdv,'gx','LineWidth',linewidth);
xlabel('Time [s]');
ylabel('Current [uA]');
adorne

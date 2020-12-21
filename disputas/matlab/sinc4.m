%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fsinc4.m
%% Description:   
%% Author:        Carsten Wulff <wulff@iet.ntnu.no>
%% Created at:    Mon Mar 24 13:19:20 2008
%% Modified at:   Mon Mar 24 13:33:32 2008
%% Modified by:   Carsten Wulff <wulff@iet.ntnu.no>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = sinc4(u,N)
y1 = fsinc(u,N);
y2 = fsinc(y1,N);
y3 = fsinc(y2,N);
y = fsinc(y3,N);


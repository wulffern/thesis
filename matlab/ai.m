%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fai.m
%% Description:   Intrinsic gain versus technology node
%% Author:        Carsten Wulff <wulff@iet.ntnu.no>
%% Created at:    Fri Sep 14 15:12:59 2007
%% Modified at:   Fri Sep 14 15:15:42 2007
%% Modified by:   Carsten Wulff <wulff@iet.ntnu.no>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


node = [ 65 90 130 180 350 ];
ain = [ 9.8 14 16 23.5 56 ];

at = 20 * log10(ain.^3/4);

plot(node,at)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ffsinc.m
%% Description:   
%% Author:        Carsten Wulff <wulff@iet.ntnu.no>
%% Created at:    Mon Mar 24 13:19:20 2008
%% Modified at:   Mon Mar 24 13:26:10 2008
%% Modified by:   Carsten Wulff <wulff@iet.ntnu.no>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = fsinc(u,N)
M = length(u) - N;
y = zeros(1,M);
for i=1:N
  y = y + u(i:M + i-1) ;
end
y = y/N;

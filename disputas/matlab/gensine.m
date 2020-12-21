%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fgensine.m
%% Description:   
%% Author:        Carsten Wulff <wulff@iet.ntnu.no>
%% Created at:    Wed Jul 30 11:54:09 2008
%% Modified at:   Mon Dec  1 10:31:09 2008
%% Modified by:   Carsten Wulff <wulff@iet.ntnu.no>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x = gensine(A,freq,FSR,fs)
%Generate samples, runs for five seconds
t = [0:1/fs:5-1/fs];

%Make sure that the number of samples is 2^N
mod(log2(length(t)),1);
if mod(log2(length(t)),1) ~= 0 
  M = length(t);
  N = 2^floor(log2(M));
  t = t(M-N+1:M);
end

%Set length
N = length(t);

%Set amplitude
A= 10^(A/20)*FSR/2;

%Find frequency bin
fbin = freq/fs*N;

%Pick a prime FFT bin
pp = primes(fbin);
fbin = pp(length(pp));

%Generate sinusoid
x = A*sin (2 *  pi * fbin * (1:N)/N);  %Input signal


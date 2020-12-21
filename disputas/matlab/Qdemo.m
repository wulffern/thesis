%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FQdemo.m
%% Description:   
%% Author:        Carsten Wulff <wulff@iet.ntnu.no>
%% Created at:    Wed Jul 30 11:24:29 2008
%% Modified at:   Thu Dec  4 13:59:54 2008
%% Modified by:   Carsten Wulff <wulff@iet.ntnu.no>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Qdemo(fname,B);
FSR = 1;         %Full scale range
fs = 44100;      %Sampling frequency
OSR = 1;
%fs = 44100;      %Sampling frequency
A = -3;         %Amplitude

%Generate a sinewave if wanted
if(fname(1:4) == 'sine')
  x= gensine(A,440,FSR,fs*OSR);
  N = length(x);
else 
  rob = wavread(fname);
  x = upsample(rob(:,1),OSR);
  amp = 2*10^(-A/20)/((max(x)-min(x)))
  x = x.*amp;
  N = length(x);
end

lsb = (max(x) - min(x))/2^B


%Calculate least significant bit
%lsb = FSR/2^B;



%Normal quantizer
yn  = round(x/lsb)*lsb;

range = max(yn/lsb) - min(yn/lsb)

%Write the nyquist output
wavwrite(yn',fs,['Qdemo_',num2str(B),'_nyq.wav']);

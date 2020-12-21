%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FSDdemo.m
%% Description:   
%% Author:        Carsten Wulff <wulff@iet.ntnu.no>
%% Created at:    Wed Jul 30 11:24:29 2008
%% Modified at:   Thu Dec  4 13:41:09 2008
%% Modified by:   Carsten Wulff <wulff@iet.ntnu.no>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function SDdemo(fname,B,dofft);
FSR = 2;         %Full scale range
fs = 44100;      %Sampling frequency
OSR = 32;
%fs = 44100;      %Sampling frequency
A = -4;         %Amplitude

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


%Calculate least significant bit
lsb = FSR/2^B;

%Sigma-delta modulator
m1 = zeros(1,N);
m2 = zeros(1,N);
y = zeros(1,N);
for i=2:N
  m1(i) = m1(i-1) + 0.25*x(i) - 0.5*y(i-1);
  m2(i) = m2(i-1) + m1(i) - 0.5*y(i-1);
  y(i)  = round(m2(i)/lsb)*lsb;
end
yo = sinc4(y,OSR)*OSR*2;

%Normal quantizer
yn  = round(x/lsb)*lsb;


%Plot FFT and time-domain for SD modulator
if(dofft==1)
  figure(1);
  w = yo.*hanning(length(yo))';
  f = 4*abs(fft(w))/(FSR*N/2);
  yf = 20*log10(f(1:length(f)/2));
  x1 = linspace(0,0.5,length(yf))*fs;
  subplot(3,1,3),plot(x1,yf);
  ylabel('Output');
  xlabel('Frequency [Hz]');
  subplot(3,1,1),plot(y(1:400),'r+-');
  xlabel('Sample [n]');
  ylabel('Output after quantizer');
  subplot(3,1,2),plot(yo(1:400),'b+-');
  xlabel('Sample [n]');
  ylabel('Output after low-pass filter')
  %Print the FFT
  mf1=['SDdemo_',num2str(B),'.pdf'];
  print('-dpdf',mf1)
end

yn_s = downsample(yn,OSR);
yo_s = downsample(yo,OSR);
x_s = downsample(x,OSR);

%Write the SD modulator output
wavwrite(yo_s',fs,['SDdemo_',num2str(B),'_sd.wav']);

%Write the original output
wavwrite(x_s',fs,['SDdemo_',num2str(B),'_orig.wav']);

%Write the nyquist output
wavwrite(yn_s',fs,['SDdemo_',num2str(B),'_nyq.wav']);

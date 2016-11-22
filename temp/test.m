
freksin=10; %Hz
fs=100; %Hz
M=128;
t=0:1/fs:1/fs*(M-1);
u=exp(1i*2*pi*freksin*t);
figure(1);
stem(t,real(u));
figure(2);
four=abs(fft(u));
stem(four);

cosfour=abs(fft(cos(2*pi*freksin*t)));
figure(3);
stem(cosfour);
title('cosfour')

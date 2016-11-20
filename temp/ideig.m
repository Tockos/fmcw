f1   = 5;
f2 = 10;
fs  = 100; %4*pi*f+1;
dt  = 1/fs;
M=200;
t=0:dt:((M-1)*dt);
kosz1 = exp(1i*2*pi*f1*t);
kosz2 = exp(1i*2*pi*f2*t);
kosz = kosz1+kosz2;

T=M*dt

figure(1);
plot(real(kosz));
figure(2);
stem(abs(fft(kosz)));

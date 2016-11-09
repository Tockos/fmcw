pkg load communications;


c=3e8;
B=7.5e7;
fc=3e9;
N=128;
M=1024;
T = 0.000390614;

v=2;
R0=1604;

fd=fc*2*v/c;
gam=B/T;
tau0=2*R0/c;

Theta=zeros(N, M);

for n=1:N
    for m=1:M
        Theta(n, m)=-2*pi*fd*n*T+2*pi*(gam*tau0-fd-2*v/c*B*n)*T/M*m;
    end
end


Out=exp(1i*Theta);
Res=fft2(Out);
Resdir=rot90(log10(abs(Res)));

Resplot=[fliplr(Resdir(:, 1:N/2)) fliplr(Resdir(:, N/2+1 : N))];

figure(1);
imagesc(real(Out));
title('theta');
figure(2);
imagesc(Resplot);

title('res');



N=128;
M=128;
fr=22;
fv=16;
dt=1/128;

Mixed=[];

for n=1:N
    for m=1:M
        Mixed(n, m)=exp(100+1i*(2*pi*(fr*(102+n/100)*dt*m+fv*dt*n)));
    endfor
endfor


%stem(real(Mixed))
imagesc(log10(abs(fft2(Mixed))));



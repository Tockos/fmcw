
    %c=3e8;
%    B=20;
%    fc=40;
%    N=1;
%    M=1500;
%    T=1;
c=3e8;
B=7.5e7;
fc=3e8;
N=1;%N=128;
M=512000;
T = 0.000390614;

    dt=T/M;
    fs=1/dt;
    %v=2;
    %R0=1604;

    %fd=fc*2*v/c;
    %gam=B/T;
    %tau0=2*R0/c;

    t=0:dt:N*T-dt;
    t_hat=rem(t, T);
    Sm=t_hat/T;
    Kfm=B/2;
     Sfm=cos(2*pi*fc*t+2*pi*Kfm*cumsum(Sm));


    figure(1);
    %plot(t,2*pi*fc*t+2*pi*Kfm*cumsum(Sm) );
    Sfm=chirp(t_hat, fc-B/2, T, fc+B/2);
    step=ceil(T/100*fs);    # one spectral slice every 10 ms
    window=ceil(T/20*fs); # 50 ms data window
    specgram(Sfm, 2^nextpow2(window), fs, window, window-step);
    figure(2);
    %plot(t,Sm);

    %figure(3);
    win=1/fc*100;
    win_vect=ones(length(t), 1)*win;
    subt_win_t=win-t;
    t_index=find(subt_win_t(end, :)<0);
    plot(t(1:t_index),Sfm(1:t_index));


%        x = chirp([0:0.001:2],0,2,200);  # freq. sweep from 0-500 over 2 sec.
%            Fs=1000;                  # sampled every 0.001 sec so rate is 1 kHz
%            step=ceil(20*Fs/1000);    # one spectral slice every 20 ms
%            window=ceil(100*Fs/1000); # 100 ms data window
%            specgram(x, 2^nextpow2(window), Fs, window, window-step);
%    ylim("auto");
    %figure(4);
    %specgram(Sfm );
    %plot(Sfm(1:M));
    %specgram(chirp([0:0.001:5]));


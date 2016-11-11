

    c=3e8;
B=2e8;
fc=3e8;
N=2;%N=128;
M=2100000;
T = 0.000390614;

    %fc=40;
    %N=1;
    %M=1500;
    %T=1;
%v=2;
%R0=1604;


%main

    %fd=fc*2*v/c;
    %gam=B/T;
    %tau0=2*R0/c;
    dt=T/M;
    fs=1/dt;

    t=0:dt:N*T-dt;
    t_hat=rem(t, T);

    Sm=2*t_hat/T-1;
    Kfm=B/2;
    theta=2*pi*Kfm*cumsum(Sm)*dt;
    Sfm=cos(2*pi*fc*t+theta);


   % Sfm=chirp(t_hat, fc-B/2, T, fc+B/2);
    step=ceil(T/100*fs);    # one spectral slice every 10 ms
    window=ceil(T/20*fs); # 50 ms data window

    win=1/fc*100;
    win_vect=ones(length(t), 1)*win;
    subt_win_t=win-t;
    t_index=find(subt_win_t(end, :)<0);

%plots
    figure(1);
    specgram(Sfm, 2^nextpow2(window), fs, window, window-step);

    %figure(2);
    %plot(t,Sfm);

    figure(3);
    plot(t(1:t_index),Sfm(1:t_index));

    figure(4);
    plot(t(1:t_index), Sfm(length(t)/N-t_index+1:length(t)/N));

    figure(5);
    plot(t, 2*pi*fc*t+theta);





































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


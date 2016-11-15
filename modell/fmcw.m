        pkg load communications;


    %c=3e8;
    %B=7.5e7;
    %fc=3e9;
    %N=128;
    %M=1024;
    %T = 0.000390614;
    %
    v=1;
    R0=100;

    c=299792458;
    v_max_exp=120 ;
    v_res_exp= 2;
    r_max_exp= 1000;
    r_res_exp= 1;

    [B, fc, T, M, N, v_max, v_res, r_max, r_res ]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp);
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

    %figure(1);
    %imagesc(real(Out));
    %title('theta');
    %figure(2);
    %imagesc(Resplot);
%
    %title('res');


    figure(3);

    subplot(2, 2, 1);
    plot(real(Out)(1,1 :100 ));
    title("1")

    subplot(2, 2, 2);
    plot(real(Out)(10,1 : 100));
    title("2")

    subplot(2, 2, 3);
    plot(real(Out)(19,1 :100 ));
    title("3")

    subplot(2, 2, 4);
    plot(real(Out)(28,1 : 100));
    title("4")

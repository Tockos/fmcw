function [one_chirp, chirp_nos, fs] = gen_chirp(fc, B, T, N, is_disp='none')

    BW = 2*(fc + B + sqrt((fc + B / 2) * B / 2));
    acc_fact=1.5;                    # for more accurate chirp signal
    chirp_nos  = round(BW * T * 2*acc_fact);        # (according to shannon theorem)

    dt    = T / chirp_nos       ;
    fs    = 1 / dt      ;
    t=0:dt:T-dt;%t     = 0:dt:N*T-dt ;            #LEHET, HOGY TÖBBET KELL GENERÁLNI
    

    Sm    = 2*t/T-1             ;
    Kfm   = B/2                     ;
    theta = 2*pi*Kfm*cumsum(Sm)*dt  ;
    one_chirp  = exp(1i*(2*pi*fc*t+theta))    ;
    %Sfm=chirp(t_hat, fc-B/2, T, fc+B/2);

    %Strans=repmat(Sfm, [N, 1]);
    if is_disp == 'spec'
        disp_spec(Sfm, T, fs, fc, t);        #spectrogram

    elseif is_disp == 'plot'
        disp_plot(Sfm, t, N, fc, theta);    

    elseif is_disp == 'both'
        disp_spec(Sfm, T, fs, fc, t)
        disp_plot(Sfm, t, N, fc, theta);

    endif


endfunction

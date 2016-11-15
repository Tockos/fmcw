function [Strans, one_chirp_r, fs_r, Sfm] = gen_chirp(fc, B, T, N, is_disp='none')

    BW = 2*(fc + B + sqrt((fc + B / 2) * B / 2));
    acc_fact=1.5;                    # for more accurate chirp signal
    chirp_nos  = round(BW * T * 2*acc_fact);        # (according to shannon theorem)

    dt    = T / chirp_nos       ;
    fs    = 1 / dt      ;
    t=0:dt:T-dt;%t     = 0:dt:N*T-dt ;            #LEHET, HOGY TÖBBET KELL GENERÁLNI
    t_hat = rem(t, T)   ;
    

    Sm    = 2*t_hat/T-1             ;
    Kfm   = B/2                     ;
    theta = 2*pi*Kfm*cumsum(Sm)*dt  ;
    Sfm   = exp(1i*(2*pi*fc*t+theta))    ;
    %Sfm=chirp(t_hat, fc-B/2, T, fc+B/2);

    %Strans=repmat(Sfm, [N, 1]);
    Strans=ones(N, chirp_nos);
    if is_disp == 'spec'
        disp_spec(Sfm, T, fs, fc, t);        #spectrogram

    elseif is_disp == 'plot'
        disp_plot(Sfm, t, N, fc, theta);    

    elseif is_disp == 'both'
        disp_spec(Sfm, T, fs, fc, t)
        disp_plot(Sfm, t, N, fc, theta);

    endif

    if nargout>0, Sfm_r       = Sfm         ; endif
    if nargout>1, one_chirp_r = Sfm(1: chirp_nos)    ; endif
    if nargout>2, fs_r        = fs          ; endif

endfunction

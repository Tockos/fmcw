
function disp_spec(Sfm, T, fs, fc, t)
    step   = ceil(T / 100 * fs);    # one spectral slice every 100 ms
    window = ceil(T / 20  * fs);    # 20 ms data window
    
    win         = 1 / fc * 100              ;
    win_vect    = ones(length(t), 1)*win    ;

    figure(1);
    title ("Sectogram"      );
    xlabel("Time [sec]"     );
    ylabel("Frequency [Hz]" );
    specgram(real(Sfm), 2^nextpow2(window), fs, window, window-step);
endfunction

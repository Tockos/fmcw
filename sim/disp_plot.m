
function disp_plot(Sfm, t, N, fc, theta)
    win         = 1 / fc * 100              ;
    subt_win_t  = win - t                   ;
    t_index     = find(subt_win_t(end, :)<0);

    figure(2);
    subplot(2, 1, 1); plot(t(1:t_index), real(Sfm)(1:t_index))                        ; title("Time window (low freq)" );
    %subplot(2, 1, 2); plot(t(1:t_index), real(Sfm)(length(t)/N-t_index+1:length(t)/N)); title("Time window (high freq)");      #for lenght data
    subplot(2, 1, 2); plot(t(1:t_index), real(Sfm)(length(t)-t_index+1:end)); title("Time window (high freq)");      #for single chirp
    xlabel("Time [sec]"     );
    ylabel("Frequency [Hz]" );

    figure(3);
    title("Phase");
    xlabel("Time [sec]" );
    ylabel("Phase [rad]");
    plot(t, 2*pi*fc*t+theta);
endfunction


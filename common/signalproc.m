function [Out_2dfft Mixed_sum Out_fft_v]=signalproc(targets)

    global N M ;
    
    Mixed_sum=zeros(N, M);

    for num=1:length(targets)

        Mixed_sum = Mixed_sum + targets(num).Mixed;

    endfor


    %Out_fft_r=
    Freq_mixed_v=fft(Mixed_sum);
    Freq_mixed_plot_v=log10(abs(Freq_mixed_v));
    Out_fft_v=[Freq_mixed_plot_v(N/2+1:end , : ) ; Freq_mixed_plot_v(1:N/2, :)];

    Freq_mixed=fft2(Mixed_sum);
    Freq_mixed_plot=log10(abs(Freq_mixed));

    Out_2dfft=[Freq_mixed_plot(N/2+1:end , : ) ; Freq_mixed_plot(1:N/2, :)];
    

endfunction

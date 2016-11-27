function Out=signalproc(targets)

    global N M ;
    
    Mixed_sum=zeros(N, M);

    for num=1:length(targets)

        Mixed_sum = Mixed_sum + targets(num).Mixed;

    endfor


    Freq_mixed=fft2(Mixed_sum);
    Freq_mixed_plot=log10(abs(Freq_mixed));

    Out=[Freq_mixed_plot(N/2+1:end , : ) ; Freq_mixed_plot(1:N/2, :)];

    

endfunction

function [Out]=signalproc(targets)

global N M;

    Mixed=zeros(N, M);
    for num=1:length(targets)

        Mixed = Mixed + exp(1i*targets(num).Theta);

    endfor

    Res=fft2(Mixed);
    Resplot=log10(abs(Res));

    Out=[flipud(Resplot(1:N/2, :)) ;flipud(Resplot(N/2+1:end , : ))];

endfunction

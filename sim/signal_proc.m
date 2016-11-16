
function signal_proc(Smixed, N, M)
    
    Res=fft2(Smixed);
    Resdir=rot90(log10(abs(Res)));

    Resplot=[fliplr(Resdir(:, 1:N/2)) fliplr(Resdir(:, N/2+1 : N))];

    figure(1);
    imagesc(real(Smixed));
    title('theta');
    figure(2);
    imagesc(Resplot);

    title('res');

    
endfunction

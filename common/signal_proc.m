
function signal_proc(Smixed, N, M)
    
    Res=log10(abs(fft2(Smixed)));
    %Resdir=rot90(log10(abs(Res)));

    Res_plot=[flipud(Res(1:N/2, :)) ; flipud(Res(N/2+1 : N, :))];

    %figure(1);
    %imagesc(real(Smixed));
    %title('theta');
    figure(2);
    imagesc(Res_plot);

    title('res');

    
endfunction

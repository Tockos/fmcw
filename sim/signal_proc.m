
function signal_proc(Smixed, N, M)

    chirp_nos = floor(length(Smixed));                 # Chirp number of samples
    dec_fact = floor(chirp_nos / M);        # mintaszám biztos nagyobb legyen, mint az elvárt (round down)

    Mixed_Chop = zeros(N, M);

    chirp_nos
    length(Smixed)


    for n=1:N
        chirp = Smixed(n, : );
        chirp_dec = decimate(chirp, dec_fact);
        
        Mix_dec(n, :) = chirp_dec(1:M);
    endfor

    
    Res=fft2(Mix_dec);
    Resdir=rot90(log10(abs(Res)));

    Resplot=[fliplr(Resdir(:, 1:N/2)) fliplr(Resdir(:, N/2+1 : N))];

    figure(1);
    imagesc(real(Mix_dec));
    title('theta');
    figure(2);
    imagesc(Resplot);

    title('res');

    
endfunction

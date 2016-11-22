function targets_ext = simulation(targets)

    global fc B T N M;
    [One_chirp, chirp_nos, fs] = gen_chirp(fc, B, T, N, 'none');

    
    targets_ext = struct([]);

    for num=1 : length(targets)
        targets_ext(num).v = targets(num).v;
        targets_ext(num).r0 = targets(num).r0;
        for n=1 : N
            
            [Srec, tau_shift] = gen_rec(One_chirp, n, chirp_nos, T, targets(num).v, targets(num).r0);
            [Dec_mix] = mix(One_chirp, Srec, M, chirp_nos);
            targets_ext(num).Mixed(n, :) = Dec_mix;

        endfor
    endfor

endfunction

function [Srec, fd, tau] = gen_rec(One_chirp, N, T, v, r0, fc)

    c=3e8;           # speed of light
    t=(0:N-1)*T;        #time sampled by T

    fd  = fc*2*v / (c-v);           # instead c-v, c can be written because of relative small velocy
    r   = r0 - v*t;            # R=R0-v*t
    tau = 2*r / c;              #time dependent time shift

    chirp_nos=length(One_chirp);
    Srec = zeros(N,chirp_nos);

    %chirp_nos
    %length(Smixed)


    for n=1:N

        t_shift=round(tau(n)*chirp_nos/T);
        Srec(n, t_shift+1: end  )= One_chirp(1 : end-t_shift);
        
    endfor
    imagesc(Srec);

endfunction















function [Srec, tau_shift] = gen_rec(One_chirp, n, chirp_nos, T, v, r0)

    c=3e8;           # speed of light

    r   = r0 - v*(n-1)*T;            # R=R0-v*t
    tau = 2*r / c;              #time dependent time shift

    Srec = zeros(1, chirp_nos);

    tau_shift=round(tau*chirp_nos/T);
    Srec(1+tau_shift : end) = One_chirp(1 : end-tau_shift)*0.5;

endfunction















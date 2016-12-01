function [Srec, tau_shift] = gen_rec(One_chirp, n, chirp_nos, target)

    global c T Noise;
    r   = target.r0 - target.v*(n-1)*T;            # R=R0-v*t
    tau = 2*r / c;              #time dependent time shift
    ur=sqrt(target.pr);

    Srec_clean = zeros(1, chirp_nos);

    tau_shift=round(tau*chirp_nos/T);
    Srec_clean(1+tau_shift : end) = One_chirp(1 : end-tau_shift)*ur;
    Srec=Srec_clean;%+Noise;

endfunction















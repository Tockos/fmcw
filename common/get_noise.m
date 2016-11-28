function [Noise p_noise] = get_noise(chirp_nos)

    global k B t_noise;

    p_noise=k*B*t_noise;

    Noise = wgn(1, chirp_nos, p_noise);

endfunction

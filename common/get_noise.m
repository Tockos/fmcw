function [Noise_matrix, p_noise] = get_noise()

    global k B pt t_noise M N fb_max;

    noise_B = fb_max;
    p_noise=k*noise_B*t_noise;

    %Noise_vector = wgn(1, chirp_nos, p_noise);
    Noise_matrix = wgn(N, M, p_noise);

endfunction

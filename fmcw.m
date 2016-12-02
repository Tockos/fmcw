#!/usr/bin/octave -qf

    pkg load communications;

    addpath( 'sim', 'modell', 'common');   
    global c B fc T gam M N v_max v_res r_max r_res pt g k t_noise fb_max Noise_re_vect Noise_re_matr Noise_im_vect Noise_im_matr;
    const;

    argv1 = argv(){1};

    r_max_exp= 256;
    r_res_exp= 1;
    v_max_exp= 128;
    v_res_exp= 1;

        
    [B, fc, T, gam, M, N, v_max, v_res, r_max, r_res, fb_max]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp);
    
    %targets = gen_rand_targets(1);
    get_targets;

    [Noise_re_matr] = get_noise();   # simulation works with noise_re_vect just for fun
    [Noise_im_matr] = get_noise();

    if (argv1 == "s")
        targets_rec = simulation(targets);   # +Noise is commented out at this moment
    elseif(argv1 == "m")
        targets_rec = modell(targets);
    else
        disp("No such option");
        exit(1);
    endif

    [Out_2dfft Mixed_sum Out_fft_v] = signalproc(targets_rec);
    disp_rd(Out_2dfft, Mixed_sum, Out_fft_v);
    
    input(">>>");

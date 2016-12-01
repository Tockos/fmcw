#!/usr/bin/octave -qf

    pkg load communications;

    addpath( 'sim', 'modell', 'common');   
    global c B fc T gam M N v_max v_res r_max r_res pt g k t_noise; 
    const;

    argv1 = argv(){1};

    r_max_exp= 300;
    r_res_exp= 0.5;
    v_max_exp= 500;
    v_res_exp= 1;

        
    [B, fc, T, gam, M, N, v_max, v_res, r_max, r_res ]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp);
    
    %targets = gen_rand_targets(1);
    get_targets;

    if (argv1 == "s")
        targets_rec = simulation(targets);
    elseif(argv1 == "m")
        targets_rec = modell(targets);
    else
        disp("No such option");
        exit(1);
    endif

    [Out_2dfft Mixed_sum Out_fft_v] = signalproc(targets_rec);
    disp_rd(Out_2dfft, Mixed_sum, Out_fft_v);
    
    input(">>>");

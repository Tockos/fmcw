#!/usr/bin/octave -q

    pkg load communications;
    argv1 = "simulation"; %argv(){1};

    addpath( 'sim', 'modell', 'common');   
    global c B fc T gam M N v_max v_res r_max r_res;   
    const;


    v_max_exp=100;
    v_res_exp= 1;
    r_max_exp= 1000;
    r_res_exp= 1;

        
    [B, fc, T, gam, M, N, v_max, v_res, r_max, r_res ]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp);
    
    %targets = gen_rand_targets(1);
    get_targets;

    if (argv1 == "simulation")
        targets_rec = simulation(targets);
    elseif(argv1 == "modell")
        targets_rec = modell(targets);
    else
        disp("No such option");
    endif

    Out = signalproc(targets_rec);
    disp_rd(Out);

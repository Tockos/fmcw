    pkg load communications;
    addpath( 'modell', 'common');   %sim %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    global c B fc T gam M N v_max v_res r_max r_res;   
    const;


    v_max_exp=100;
    v_res_exp= 1;
    r_max_exp= 2000;
    r_res_exp= 1;

        
    [B, fc, T, gam, M, N, v_max, v_res, r_max, r_res ]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp);
    
    targets = gen_rand_targets(3);
    %get_targets;

    %sim(targets);
    targets_rec = modell(targets);

    Out = signalproc(targets_rec);
    disp_rd(Out);

    pkg load communications;

    global c B fc T gam M N v_max v_res r_max r_res;   

    tr1=struct;
    tr2=struct;
    tr3=struct;
    tr4=struct;
    tr1.v=100; tr1.r0=100;
    tr2.v=120; tr2.r0=200;
    tr3.v=-80; tr3.r0=800;
    tr4.v=0; tr4.r0=600;
    targets=[tr1];

    c=299792458;
    v_max_exp=100;
    v_res_exp= 1;
    r_max_exp= 2000;
    r_res_exp= 1;

        
    [B, fc, T, gam, M, N, v_max, v_res, r_max, r_res ]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp);


    for num=1:length(targets)
        
        targets(num).fd = get_doppler(targets(num).v);
        targets(num).tau0 = get_tau0(targets(num).r0);
        targets(num).Theta = get_theta(targets(num));

    endfor

    Out=signalproc(targets);
    disp_rd(Out);


c=299792458;
v_max_exp=60 ;
v_res_exp= 1;
r_max_exp= 1000;
r_res_exp= 2;

[B, fc, T, gam, M, N, v_max, v_res, r_max, r_res ]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp);
signal_proc(Smixed, N, M);


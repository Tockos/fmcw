clear all;
v =20;
r0=300;

c=299792458;
v_max_exp=60 ;
v_res_exp= 2;
r_max_exp= 500;
r_res_exp= 2;

[B, fc, T, M, N, v_max, v_res, r_max, r_res ]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp);

%[Strans, chirp, fs] = gen_chirp(fc, B, T, N, 'none');
T=T/10;
Strans=ones(32, 1000000);
One_chirp=ones(1, 1000000);
[Srec, fd, tau] =gen_rec(One_chirp, N, T, v, r0, fc);
[Smixed] = mix(Strans, Srec);
%signal_proc(Smixed, N, M);


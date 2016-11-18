clear all;
v =[5 -10];
r0=[400 800];

c=299792458;
v_max_exp=60 ;
v_res_exp= 1;
r_max_exp= 1000;
r_res_exp= 2;

[B, fc, T, M, N, v_max, v_res, r_max, r_res ]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp);
[One_chirp, chirp_nos, fs] = gen_chirp(fc, B, T, N, 'none');

Tau_shift=zeros(1, N);
Smixed=zeros(N, M);

for n= 1 : N
    
    
    [Srec, tau_shift] = gen_rec(One_chirp, n, chirp_nos, T, v, r0);
    [Dec_mix] = mix(One_chirp, Srec, M, chirp_nos);
    Tau_shift(n)=tau_shift;
    Smixed(n, :)=Dec_mix;
endfor
signal_proc(Smixed, N, M);


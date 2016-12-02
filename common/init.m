function [B, fc, T, gam, M, N, v_max, v_res, r_max, r_res, fb_max ]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp)
    c=3e8;

    M = 2^round(log2(r_max_exp / r_res_exp));

    r_res=r_res_exp;
    r_max=r_res_exp*M;

    B=c/(2*r_res);

    N = 2^round(log2(v_max_exp / v_res_exp));

    v_res=v_res_exp;
    v_max=v_res_exp*N;

    T_min=10*2*r_max/c;                  # tau_max is 10% of the chirp time
    fc_min=100/5*B;                      # 5% relative bandwidth
    
    T_max=c/(2*v_max)/fc_min;              
    T=mean([T_max, T_min]);
    fc=c/(2*v_max)/T;            
    
    gam=B/T;

    fb_max = M/T;
  
endfunction

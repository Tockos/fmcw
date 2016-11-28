function pr = radar_eq(target)
    global c B fc T gam M N v_max v_res r_max r_res pt g; 
    
    lam=c/fc;
    pr = pt*g^2*lam^2*target.rcs/((4*pi)^3*target.r0^4);
    sqrt(pr) 

endfunction

function targets_ext=modell(targets)

    global c B fc T gam M N v_max v_res r_max r_res;   

    targets_ext=struct([]);
    for num=1:length(targets)
        
        targets_ext(num).r0=targets(num).r0;
        targets_ext(num).v=targets(num).v;
        targets_ext(num).fd = get_doppler(targets_ext(num).v);
        targets_ext(num).tau0 = get_tau0(targets_ext(num).r0);
        targets_ext(num).Theta = get_theta(targets_ext(num));
        targets_ext(num).Mixed = exp(1i*targets_ext(num).Theta);
    endfor

    targets_ext(1).Theta
endfunction

function targets=gen_rand_targets(target_num)

    global r_max r_res v_max v_res;

    targets=struct([]);

    for ind=1:target_num
        temp_tr=struct;
        temp_tr.r0=r_max*rand(1, 1);
        temp_tr.v=v_max*rand(1, 1);
        targets(ind)=temp_tr;
    endfor

endfunction


function [r_meas, v_meas] = get_measure(Target_rd)
    global N r_res v_res;

    [r_sig, r_indexes]=max(Target_rd(1, :));
    r_ind = mode(r_indexes);
    r_meas=r_ind*r_res;

    [v_sig, v_ind] = max(Target_rd(:, r_ind));
    v_meas = (v_ind-N/2)*v_res;

endfunction

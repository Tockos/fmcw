
function [r_meas, v_meas] = get_measure(Mixed)
    global N r_res v_res;

    [r_sig, r_indexes]=max(Mixed(1, :));
    r_ind = mode(r_indexes);
    r_meas=r_indexes; %r_ind*r_res-r_res;

    [v_sig, v_ind] = max(Mixed(:, r_ind));
    v_meas = (v_ind-N/2)*v_res;

endfunction

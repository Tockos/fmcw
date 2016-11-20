function targets=gen_target(target_num)

global r_max r_res v_max v_res;


targets=zeros(1, target_num);

for ind=1:target_num
    targets(ind)=struct;
    targets(ind).r0=r_max*rand(1, 1);
    targets(ind).v=v_max*rand(1, 1);
endfor


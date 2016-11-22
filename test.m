addpath('modell', 'sim', 'common');
global c B fc T gam M N v_max v_res r_max r_res;   

c=299792458;
v_max_exp=32;
v_res_exp= 1;
r_max_exp=32;
r_res_exp= 1;

    
[B, fc, T, gam, M, N, v_max, v_res, r_max, r_res ]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp);

R_points=1:r_res:r_max;
V_points=-v_max/2+v_res:v_res:v_max/2;

r_stat=round(r_max*rand(1, 1));
v_stat=round(v_max*rand(1, 1));


%distance measurement to file
    fileID = fopen('test_r.txt','w');
    fprintf(fileID,'%15s %30s\n','real distance','measured distance');
    fprintf(fileID,'==============================================\n');

    for ind=1:length(R_points)

        target=struct;
        target.r0=R_points(ind);
        target.v=v_stat;
        target_rec=modell(target);
        [r_meas, v_meas] = get_measure(target_rec.Mixed);
        
        fprintf(fileID,'%15d %30d\n', R_points(ind), r_meas);
        %if(ind==3) break; endif
    endfor

    fclose(fileID);


%velocy measurement to file

    fileID = fopen('test_v.txt','w');
    fprintf(fileID,'%15s %30s\n','real velocy','measured velocy');
    fprintf(fileID,'==============================================\n');

    for ind=1:length(V_points)

        target=struct;
        target.r0=r_stat;
        target.v=V_points(ind);
        target_rec=modell(target);
        [r_meas, v_meas] = get_measure(target_rec(1).Mixed);

        fprintf(fileID,'%15d %30d\n', V_points(ind), v_meas);

        %if(ind==3) break; endif
    endfor

    fclose(fileID);


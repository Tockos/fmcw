#!/usr/bin/octave -qf

addpath('modell', 'sim', 'common');
global c B fc T gam M N v_max v_res r_max r_res;   

c=299792458;
r_max_exp=str2num(argv(){1});
r_res_exp=str2num(argv(){2});
v_max_exp=str2num(argv(){3});
v_res_exp=str2num(argv(){4});

    
[B, fc, T, gam, M, N, v_max, v_res, r_max, r_res ]=init(v_max_exp, v_res_exp, r_max_exp, r_res_exp);


R_points=1:r_res:r_max;
V_points=-v_max/2+v_res:v_res:v_max/2;

r_stat=round(r_max*rand(1, 1));
v_stat=round(v_max*rand(1, 1));


%distance measurement to file
    fileID = fopen("/home/tockos/bme/onlab/fmcw/temp/r.txt","w");
    fprintf(fileID,'%15s %30s\n','real distance','measured distance');
    fprintf(fileID,'==============================================\n');

    for ind=1:length(R_points)

        target=struct;
        target.r0=R_points(ind);
        target.v=v_stat;
        target_rec=modell(target);
        Target_rd=signalproc(target_rec);
        [r_meas, v_meas] = get_measure(Target_rd);
        
        fprintf(fileID,'%15d %30d\n', R_points(ind), r_meas);
        %if(ind==1) break; endif
    endfor

    fclose(fileID);


%velocy measurement to file

    fileID = fopen("/home/tockos/bme/onlab/fmcw/temp/v.txt",'w');
    fprintf(fileID,'\n\n%15s %30s\n','real velocy','measured velocy');
    fprintf(fileID,'==============================================\n');

    for ind=1:length(V_points)

        target=struct;
        target.r0=r_stat;
        target.v=V_points(ind);
        target_rec=modell(target);
        Target_rd=signalproc(target_rec);
        [r_meas, v_meas] = get_measure(Target_rd);
        
        fprintf(fileID,'%15d %30d\n', V_points(ind), v_meas);

        %if(ind==1) break; endif
    endfor

    fclose(fileID);


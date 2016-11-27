function disp_rd(Out)

    global N M r_res v_res r_max v_max;

    xtick_num=16;
    ytick_num=16;

    xtick_start=1;
    xtick_res=M/xtick_num;
    xtick_end=M;

    ytick_start=1;
    ytick_res=N/ytick_num;
    ytick_end=N;

    xticklabel_start=r_res;
    xticklabel_res=M/xtick_num*r_res;
    xticklabel_end=M*r_res;

    yticklabel_start=N/2*v_res;
    yticklabel_res=-N/ytick_num*v_res;
    yticklabel_end=(-N/2+1)*v_res;

    xtick=[xtick_start:xtick_res:xtick_end xtick_end];
    ytick=[ytick_start:ytick_res:ytick_end ytick_end];

    xticklabel=[xticklabel_start:xticklabel_res:xticklabel_end xticklabel_end];
    yticklabel=[yticklabel_start:yticklabel_res:yticklabel_end yticklabel_end];

    figure(1)
    plot(real(Out)(1,1 :100 ))

    figure(2)
    imagesc(Out)
    
    hax=gca();

    set(hax, "ytick", ytick);
    set(hax, "YTickLabel", yticklabel);
    set(hax, "xtick", xtick);
    set(hax, "XTickLabel", xticklabel);
    %set(hax, "ydir", "reverse");


endfunction

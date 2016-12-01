function disp_rd(Out_2dfft, Mixed_sum, Out_fft_v)

    global N M r_res v_res r_max v_max;

    xtick_num=16;
    ytick_num=16;

    xtick_start=1;
    xtick_res=M/xtick_num;
    xtick_end=M;

    ytick_start=1;
    ytick_res=N/ytick_num;
    ytick_end=N;

    xticklabel_start=0;
    xticklabel_res=M/xtick_num*r_res;
    xticklabel_end=(M-1)*r_res;

    yticklabel_start=N/2*v_res;
    yticklabel_res=-N/ytick_num*v_res;
    yticklabel_end=(-N/2+1)*v_res;

    xtick=[xtick_start:xtick_res:xtick_end xtick_end];
    ytick=[ytick_start:ytick_res:ytick_end ytick_end];

    xticklabel=[xticklabel_start:xticklabel_res:xticklabel_end xticklabel_end];
    yticklabel=[yticklabel_start:yticklabel_res:yticklabel_end yticklabel_end];

    %figure(1)
    %plot(real(Out_2dfft)(1,: ))

    figure(2)
    imagesc(Out_2dfft)
    
    hax=gca();

    set(hax, "xtick", xtick);
    set(hax, "XTickLabel", xticklabel);
    set(hax, "ytick", ytick);
    set(hax, "YTickLabel", yticklabel);
    set(hax, "tickdir", "out");
    %set(hax, "ydir", "reverse");

    %figure(3)
    %surfl(Out_2dfft)

    %figure(4)
    %hold on
    %for num=1:N
        %plot(0:r_res:xticklabel_end, Out_2dfft(num, :))
    %endfor
    %hold off

    %figure(5)
    %hold on
    %for num=1:N
        %plot(real(Mixed_sum)(num, :))
    %endfor
    %hold off

    figure(6)
    imagesc(Out_fft_v)

    figure(7)
    hold on
    for num=1:N
        plot(0:r_res:xticklabel_end, Out_fft_v(num, :))
    endfor
    hold off
endfunction

function disp_rd(Out)

    figure(1)
    plot(real(Out)(1,1 :100 ))

    figure(2)
    imagesc(Out)

endfunction

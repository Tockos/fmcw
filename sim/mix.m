
function [Smixed] = mix(Strans, Srec)

Smixed=Strans.*(conj(Srec));

endfunction

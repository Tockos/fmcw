
function [Dec_mix] = mix(Strans, Srec, M, chirp_nos)

    Smixed=Strans.*conj(Srec);
    dec_fact = floor(chirp_nos / M);        # mintaszám biztos nagyobb legyen, mint az elvárt (round down)
    Dec_mix = decimate(real(Smixed), dec_fact, 'fir');
    Dec_mix=Dec_mix(1:M);
endfunction

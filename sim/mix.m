
function [Dec_mix] = mix(Strans, Srec, chirp_nos)

   global M; 
    
    Smixed=Strans.*conj(Srec);
    dec_fact = floor(chirp_nos / M);        # mintaszám biztos nagyobb legyen, mint az elvárt (round down)
    %Dec_mix = decimate(Smixed, dec_fact, 'fir');
    Dec_mix = Smixed(1:dec_fact:end);
    Dec_mix=Dec_mix(1:M);
endfunction

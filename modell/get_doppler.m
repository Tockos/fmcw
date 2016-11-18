
function[fd] = get_doppler(v)
    
    global fc c;
    fd=fc*2*v/c;
endfunction

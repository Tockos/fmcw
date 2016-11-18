

function [Theta] = get_theta(target)

    global c M N T B gam;

    Theta=zeros(N, M);
    target.fd
    target.tau0

    for n=1:N
        for m=1:M
            Theta(n, m)= -2*pi*target.fd*n*T + 2*pi*(gam*target.tau0-target.fd-2*target.v/c*B*n)*T/M*m;
        end
    end

endfunction

function [new_hess, mk] = make_positive(hessi)
%this value takes as input a 2x2 hessian matrix and returns a positive one
%that was produced by adding the minimum value of mk times the unit matrix,
%as well as the number mk

    m = 1;
    while 1
        eigV = eig(hessi);
        if(eigV(1)>0 && eigV(2)>0)
            break;
        else
            hessi(1,1) = hessi(1,1)+1;
            hessi(2,2) = hessi(2,2)+1;
        end
        m = m+1;
    end
    mk = m-1;
    new_hess = hessi;
end
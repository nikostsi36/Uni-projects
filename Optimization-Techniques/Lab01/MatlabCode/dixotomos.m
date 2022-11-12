

function [ak, bk, k] = dixotomos(f, e, l, a, b)
    ak(1) = a;
    bk(1) = b;

    k=1;
    %step1
    while 1
        if bk(k)-ak(k)<l
            break;
        else
        x1 = (ak(k)+bk(k))/2 - e;
        x2 = (ak(k)+bk(k))/2 + e;
        end
        fx1 = subs(f,x1);
        fx2 = subs(f,x2);
        %step2
        k=k+1;
        if fx1 < fx2
            ak(k) = ak(k-1);
            bk(k) = x2;
        else
            ak(k) = x1;
            bk(k) = bk(k-1);
        end
        
    end
end




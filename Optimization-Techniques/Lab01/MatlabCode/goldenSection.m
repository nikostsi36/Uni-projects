function [ak, bk, k] = goldenSection(f, l, a, b)
    ak(1) = a;
    bk(1) = b;

    g = 0.618;
    x1 = ak(1)+(1-g)*(bk(1)-ak(1));
    x2 = ak(1)+g*(bk(1)-ak(1));
    
    k=1;
    %step1
    while 1
        if bk(k)-ak(k)<l
            break;
        end
        
        fx1 = subs(f,x1);
        fx2 = subs(f,x2);
        
        %step2
        if fx1 > fx2
            ak(k+1) = x1;
            bk(k+1) = bk(k);
            x1 = x2;
            x2 = ak(k+1)+g*(bk(k+1)-ak(k+1));
            
        %step3
        else
            ak(k+1) = ak(k);
            bk(k+1) = x2;
            x2 = x1;
            x1 = ak(k+1)+(1-g)*(bk(k+1)-ak(k+1));
        end
        k=k+1;
        
    end
end
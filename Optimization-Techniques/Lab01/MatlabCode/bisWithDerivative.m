function [ak, bk, k] = bisWithDerivative(f, l, a, b)
    ak(1) = a;
    bk(1) = b;
    
    df = diff(f, 'x');
    
    n=1;
    while 1
        if ((1/2)^n) <= (l/(bk(1) - ak(1)))
            break;
        end
        n = n+1;
    end 
    
    k=1;
    while 1
         %step1
        x(k) = (ak(k)+bk(k))/2;
        
        f1x = subs(df,x(k));
        if f1x == 0
            break;
            %step2
        elseif f1x > 0
            ak(k+1) = ak(k);
            bk(k+1) = x(k);
            %step3
        else
            ak(k+1) = x(k);
            bk(k+1) = bk(k);
        end
        %step4
        if k==n
            break;
        else
            k = k+1;
        end
   
end
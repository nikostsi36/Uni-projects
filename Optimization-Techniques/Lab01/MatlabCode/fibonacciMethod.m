function [ak, bk, k] = fibonacciMethod(f, e, l, a, b)
ak(1) = a;
bk(1) = b;

fibNums(1) = 0.01;
fibNums(2) = 0.08;

i=2;
while 1
    if (fibNums(i-1) > (bk(1)-ak(1))/l)
        break;
    else
        i=i+1;
        fibNums(i)=fibNums(i-1)+fibNums(i-2);
    end
end

n=length(fibNums);

x1(1) = ak(1)+(fibNums(n-2)/fibNums(n))*(bk(1)-ak(1));
x2(1) = ak(1)+(fibNums(n-1)/fibNums(n))*(bk(1)-ak(1));

fx1(1) = subs(f,x1(1));
fx2(1) = subs(f,x2(1));

k=1;
%step1
while 1
    
    if bk(k) - ak(k) <= l
        break;
    end
    %step2
    if fx1(k) > fx2(k)
        ak(k+1) = x1(k);
        bk(k+1) = bk(k);
        x1(k+1) = x2(k);
        x2(k+1) = ak(k+1)+ (fibNums(n-k)/fibNums(n-k+1))*(bk(k+1)-ak(k+1));
        %step5
        if k == n-2
            x1(n) = x1(n-1);
            x2(n) = x1(n-1)+e;
            fx1(n) = subs(f, x1(n));
            fx2(n) = subs(f, x2(n));
            
            if fx1(n) > fx2(n)
                ak(n) = x1(n);
                bk(n) = bk(n-1);
            else
                ak(n) = ak(n-1);
                bk(n) = x2(n);
            end
            break;
            %step4
        else
            fx1(k+1) = subs(f, x1(k+1));
            fx2(k+1) = subs(f, x2(k+1));
            k=k+1;
        end
        
        
        %step3
    else
        ak(k+1) = ak(k);
        bk(k+1) = x2(k);
        x2(k+1) = x1(k);
        x1(k+1) = ak(k+1)+ (fibNums(n-k-1)/fibNums(n-k+1))*(bk(k+1)-ak(k+1));
        %step5
        if k == n-2
            x1(n) = x1(n-1);
            x2(n) = x1(n-1)+e;
            
            
            if fx1 > fx2
                ak(n) = x1(n);
                bk(n) = bk(n-1);
            else
                ak(n) = ak(n-1);
                bk(n) = x2(n);
            end
            break;
            %step4
        else
            fx1(k+1) = subs(f, x1(k+1));
            fx2(k+1) = subs(f, x2(k+1));
            k=k+1;
        end
        
    end
    
end
end
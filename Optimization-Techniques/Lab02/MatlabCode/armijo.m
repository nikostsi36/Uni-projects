function [gamma] = armijo(x,y,k,f,grad, diff)
   %this function takes as input the arrays x,y, the number k, the function
   %and its gradient and return the value of g based on armijo's rule
    a = 0.1;
    b = 0.5;
    s = 0.2;
    m = 0;
    mmax = 20;
    
    while(m<mmax)
        gk = double(grad(double(x(k-1)), double(y(k-1))));
        dk = diff(:,k-1);
        disp("1:");
        disp(double(f(double(x(k-1)),double(y(k-1)))) - double(f(double(x(k)),double(y(k)))));
        disp("2:");
        disp(double(-s*a*b^m*dk'*gk));
        if double(f(double(x(k-1)),double(y(k-1)))) - double(f(double(x(k)),double(y(k)))) >= double(-s*a*b^m *dk.'*gk)
            gamma = s*b^m;return;
        end
        
        m = m+1;
    end
    
    gamma = s*b^m;
    
end
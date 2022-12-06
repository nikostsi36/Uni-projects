function [x, y, k] = steepest_descent_min(xstart,ystart,e,g,gradf,f)
    %this function takes as input a starting x, a starting y, a funtion and
    %its gradient and returns a possible minimum point (x,y) as well as the
    %iterations we needed to find it, using the steepest descent method and
    %selecting the step that minimizes f(xk+dk*gk)    

    k = 1;

    x(k) = xstart;
    y(k) = ystart;
    gamma(k) = g;
    

while norm(gradf(x(k),y(k)))>=e
    diff(:,k) = -gradf(x(k),y(k));
    
    h = @(gk) f(x(k) + gk*diff(1,k),y(k) + gk*diff(2,k));
    gamma(k+1) = fminsearch(h,0.1);
    
    if gamma(k+1) > 5
        gamma(k+1) = 5;
    end
    
    x(k+1) = x(k)+(gamma(k)*diff(1,k));
    y(k+1) = y(k)+(gamma(k)*diff(2,k));
    
    k = k + 1;
    if(k > 1000)
        disp('1000 steps and no result');
        break;
    end
end
disp("xmin");
disp(x(k));
disp("ymin");
disp(y(k));
    
end
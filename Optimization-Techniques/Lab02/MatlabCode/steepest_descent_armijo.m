function [x, y, k] = steepest_descent_armijo(xstart,ystart,e,g,gradf,f)
    %this function takes as input a starting x, a starting y, a funtion and
    %its gradient and returns a possible minimum point (x,y) as well as the
    %iterations we needed to find it, using the steepest descent method and
    %calculating the step with armijos rule
    k = 1;
    
    x(k) = xstart;
    y(k) = ystart;
    gamma(k) = g;
    

while norm(gradf(x(k),y(k)))>=e
    diff(:,k) = -gradf(x(k),y(k));
    if (k==1)
        gamma(k) = g;
    else
        gamma(k) = armijo(x,y,k,f,gradf,diff); 
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
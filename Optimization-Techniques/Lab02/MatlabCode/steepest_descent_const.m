function [x, y, k] = steepest_descent_const(xstart,ystart,e,gamma,gradf)
    %this function takes as input a starting x, a starting y, a funtion and
    %its gradient and returns a possible minimum point (x,y) as well as the
    %iterations we needed to find it, using the steepest descent method and
    %constant step
    k = 1;

    x(k) = xstart;
    y(k) = ystart;
    

while norm(gradf(x(k),y(k)))>=e
    diff(:,k) = -gradf(x(k),y(k));
    x(k+1) = x(k)+(gamma*diff(1,k));
    y(k+1) = y(k)+(gamma*diff(2,k));
    
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
function [x, y, k] = newton_min(xstart,ystart,e,g,gradf,hessian,f)
    %this function takes as input a starting x, a starting y, a funtion,
    %its gradient and it's hessian matrix returns a possible minimum point
    %(x,y) as well as theiterations we needed to find it, using the newton 
    %method and selecting the step that minimizes f(xk+dk*gk)   
    
    k = 1;
    x(k) = xstart;
    y(k) = ystart;

    gamma(k) = g;

while norm(gradf(x(k),y(k)))>=e
    eigenV = eig(hessian(x(k),y(k)));
    if eigenV(1) > -e && eigenV(2) > -e
        diff(:,k) = -gradf(x(k),y(k));
        dk(:,k) = inv(hessian(x(k), y(k)))*diff(:,k);
        h = @(gk) f(x(k) + gk*diff(1,k),y(k) + gk*diff(2,k));
        gamma(k+1) = fminsearch(h,0.1);
        if gamma(k+1) > 5
            gamma(k+1) = 5;
        end
        x(k+1) = x(k)+(gamma(k+1)*dk(1,k));
        y(k+1) = y(k)+(gamma(k+1)*dk(2,k));

        k = k + 1;
    else
        disp('Hessian is non-positive in iteration: ');
        disp(k);
        break;
    end
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
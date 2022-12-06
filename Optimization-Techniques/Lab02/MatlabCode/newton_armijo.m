function [x, y, k] = newton_armijo(xstart,ystart,e,g,gradf,hess,f)
    %this function takes as input a starting x, a starting y, a funtion,
    %its gradient and it's hessian matrix returns a possible minimum point
    %(x,y) as well as theiterations we needed to find it, using the newton 
    %method and calculating the step with armijos rule
    
    k = 1;

    x(k) = xstart;
    y(k) = ystart;
    gamma(k) = g;

while norm(gradf(x(k),y(k)))>=e
    eigenV = eig(hess(x(k),y(k)));
    if eigenV(1) > -e && eigenV(2) > -e
        diff(:,k) = -gradf(x(k),y(k));
        dk(:,k) = inv(hess(x(k), y(k)))*diff(:,k);
        
        if (k==1)
            gamma(k) = g;
        else
            gamma(k) = armijo(x,y,k,f,gradf,diff); 
        end
        x(k+1) = x(k)+(gamma(k)*dk(1,k));
        y(k+1) = y(k)+(gamma(k)*dk(2,k));

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
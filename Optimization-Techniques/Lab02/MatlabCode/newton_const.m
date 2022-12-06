function [x, y, k] = newton_const(xstart,ystart,e,gamma,gradf,hessian)
    %this function takes as input a starting x, a starting y, a funtion,
    %its gradient and it's hessian matrix returns a possible minimum point
    %(x,y) as well as theiterations we needed to find it, using the newton 
    %method and a constant step
    
    k = 1;
    x(k) = xstart;
    y(k) = ystart;
    

while norm(gradf(x(k),y(k)))>=e
    eigenV = eig(hessian(x(k),y(k)));
    if eigenV(1) > -e && eigenV(2) > -e
        diff(:,k) = -gradf(x(k),y(k));
        dk(:,k) = inv(hessian(x(k), y(k)))*diff(:,k);
        x(k+1) = x(k)+(gamma*dk(1,k));
        y(k+1) = y(k)+(gamma*dk(2,k));

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
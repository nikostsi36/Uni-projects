function xtonos = SerPar2Lyapunov(t, xin)
    xtonos = zeros(size(xin));
    global A b gamma thetaM
    
    u = 3.5*sin(7.2*t)+2*sin(11.7*t);
    
    e1 = xin(1)-xin(3);
    e2 = xin(2)-xin(4);
    
    xtonos(1) = A(1,1)*xin(1) + A(1,2)*xin(2) + b(1)*u;
    xtonos(2) = A(2,1)*xin(1) + A(2,2)*xin(2) + b(2)*u;
    xtonos(3) = xin(5)*xin(3) + xin(6)*xin(4) + xin(9)*u - thetaM*e1;
    xtonos(4) = xin(7)*xin(3) + xin(8)*xin(4) + xin(10)*u - thetaM*e2;
    xtonos(5) = gamma(1)*xin(3)*e1;
    xtonos(6) = gamma(1)*xin(4)*e1;
    xtonos(7) = gamma(1)*xin(3)*e2;
    xtonos(8) = gamma(1)*xin(4)*e2;
    xtonos(9) = gamma(2)*u*e1;
    xtonos(10) = gamma(2)*u*e2;
end
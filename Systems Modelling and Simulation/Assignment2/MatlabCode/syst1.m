function xtonos = syst1(tin, xin, utype)
    xtonos = zeros(size(xin));
    global a b u am gamma
    if utype == "constant"
        ut = u;
    elseif utype == "sin"
        ut = u*sin(3*tin);
    end 
   
    error = xin(1) - (xin(4)*xin(2) + xin(5)*xin(3));

    xtonos(1) = -a*xin(1) + b*ut;
    xtonos(2) = -am*xin(2) + xin(1);
    xtonos(3) = -am*xin(3) + ut;
    xtonos(4) = gamma*error*xin(2);
    xtonos(5) = gamma*error*xin(3);
end


function xtonos = ParLyapunov(t, xin)
    xtonos = zeros(size(xin));
    global a b h0 f gamma
    
    u = 10*sin(3*t);
    h = h0*sin(2*pi*f*t);
    
    e = xin(1)+h-xin(4);
    
    xtonos(1) = -a*xin(1) + b*u;
    xtonos(2) = -gamma(1)*e*xin(4);
    xtonos(3) = gamma(2)*e*u;
    xtonos(4) = -xin(2)*xin(4) + xin(3)*u;
    
end


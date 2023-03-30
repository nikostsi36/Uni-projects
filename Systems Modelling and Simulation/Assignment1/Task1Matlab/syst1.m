function ytonos = syst1(t,y)
    global m b k;

    u = 15*sin(3*t) + 8;
    ytonos = [y(2) ; u/m - y(2)*b/m - y(1)*k/m];

end


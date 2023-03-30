function ytonos = syst2(t,y)
global RC LC;
u1 = 2*sin(4*t);
u1tonos = 8*cos(4*t);
u2 = 4*ones(length(t),1);
u2tonos = zeros(length(t),1);
%ytonos = [y(2); -(1/RC)*y(2) -(1/LC)*y(1)+(1/RC)*u1tonos + (1/RC)*u2tonos + (1/LC)*u2];

ytonos(1) = y(2);
ytonos(2) = -(1/RC)*y(2) -(1/LC)*y(1)+(1/RC)*u1tonos + (1/RC)*u2tonos + (1/LC)*u2;
ytonos = ytonos';
end


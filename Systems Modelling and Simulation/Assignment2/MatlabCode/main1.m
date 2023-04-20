clf;
clear;

%Setting the parameters of the system
global a b am gamma u;
a = 3;
b = 0.5;
am = 4;
gamma = 50;

%Setting time span, initial conditions and using ode45 to generate the data
%for the every t
tspan = (0:0.05:5)';   %0 to 5 secs with 0.05 as step
u = 10;

%Setting the initial values
x0 = 0;             %X(0)
phi10 = 0;          %Phi1(0)
phi20 = 0;          %Phi2(0)
theta10 = 0;        %Theta1(0)
theta20 = 0;        %Theta2(0)
% t constains all the discrete values for time and y contains the list of 
% values of x(t) and x'(t) for these values of time t
[t,x] = ode45(@(t,x) syst1(t,x,"constant"), tspan, [x0 phi10 phi20 theta10 theta20]);

phi = [x(:,2), x(:,3)];
thetaCap = [x(:,4), x(:,5)];
X = x(:,1);

xCap = dot(thetaCap',phi')';

aCap = am - thetaCap(:,1);

bCap = thetaCap(:,2);

createPlot(t, X, xCap, a, aCap, b, bCap)
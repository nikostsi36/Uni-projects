clf;
clear;

%Setting the parameters of the system
global a b gamma h0 f thetaM;
a = 3;
b = 0.5;
h0 = 0.5;
f=40;
gamma = [10 10];
thetaM = 5;

%Setting time span, initial conditions and using ode45 to generate the data
%for the every t
tspan = (0:0.05:20)';   %0 to 20 secs with 0.05 as step

%Setting the initial values
x0 = 0;                 %X(0)
theta10 = 0;            %thetaCapi1(0)
theta20 = 0;            %thetaCap2(0)
xCap0 = 0;              %xCap(0)

% t constains all the discrete values for time and y contains the list of 
% values of x(t) and x'(t) for these values of time t
[t,xPar] = ode45(@(t,x) SerParLyapunov(t,x), tspan, [x0 theta10 theta20 xCap0]);

X = xPar(:,1);
aCap = xPar(:,2);
bCap = xPar(:,3);
xCap = xPar(:,4);

createPlot(t, X, xCap, a, aCap, b, bCap)
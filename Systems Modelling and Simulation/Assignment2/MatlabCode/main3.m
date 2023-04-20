clf;
clear;

%Setting the parameters of the system
global A b gamma thetaM;
A = [-0.25 3;-5 0];
b = [0.5 1.5];
gamma = [5000 5000];
thetaM = 0.5;

%Setting time span, initial conditions and using ode45 to generate the data
%for the every t
tspan = (0:0.05:20)';   %0 to 20 secs with 0.05 as step

%Setting the initial values
initialConditions = zeros(1,10);
% t constains all the discrete values for time and y contains the list of 
% values of x(t) and x'(t) for these values of time t
[t,xPar2] = ode45(@(t,x) SerPar2Lyapunov(t,x), tspan, initialConditions);

x1 = xPar2(:,1);
x2 = xPar2(:,2);
x1cap = xPar2(:,3);
x2cap = xPar2(:,4);
acap11 = xPar2(:,5);
acap12 = xPar2(:,6);
acap21 = xPar2(:,7);
acap22 = xPar2(:,8);
bcap1 = xPar2(:,9);
bcap2 = xPar2(:,10);

createPlot2(t, x1, x1cap, "X1");
createPlot2(t, x2, x2cap, "X2");

createPlot2(t, A(1,1), acap11, "a11");
createPlot2(t, A(1,2), acap12, "a12");
createPlot2(t, A(2,1), acap21, "a21");
createPlot2(t, A(2,2), acap22, "a22");

createPlot2(t, b(1), bcap1, "b1");
createPlot2(t, b(2), bcap2, "b2");
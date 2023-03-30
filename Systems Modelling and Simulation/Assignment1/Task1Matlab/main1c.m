%Clearing variables and figures
clear;
clf;

%Setting the parameters of the system
global m b k;
m = 10;
b = 0.5;
k = 2.5;

%Setting time span, initial conditions and using ode45 to generate the data
%for the every t
tspan = 0:0.1:10;
y0 = 0;
yon0 = 0;
% t constains all the discrete values for time and y contains the list of 
% values of y(t) and y'(t) for these values of time t
[t,y] = ode45(@(t,y) syst1(t,y), tspan, [y0 yon0]);


% Applying Least Squares Method to find best set of parameters
%setting the values for lamda in L(s)
lamda1 = 3;
lamda2 = 2;
%lamda1=3 and lamda2 = 2 means pole1 = 1 and pole2 = 2

u=15*sin(3*t)+ 8;

%Generating the 101*3 phi(t) matrix
% we use the factors for zeta that we found in a) to calculate each row
% of phi
phi1 = lsim(tf([-1 0],[1 lamda1 lamda2]),y(:,1),t);
phi2 = lsim(tf(-1,[1 lamda1 lamda2]),y(:,1),t);
phi3 = lsim(tf(1,[1 lamda1 lamda2]),u,t);

%initiating phi
phi = zeros(length(t),3);

%filling phi
phi(:,1) = phi1;
phi(:,2) = phi2;
phi(:,3) = phi3;

% Calculating the sum of (phiTranspose*phi) for t=1, 2, ..., N and save it
% in sumT

sumT = phi.'*phi;
sumY = y(:,1).'*phi;
thetaTranspose = sumY/sumT;
theta0 = thetaTranspose.';

%calculating the values for m,k,b from theta
m = 1/theta0(3);
k = (theta0(2)+lamda2)*m;
b = (theta0(1)+lamda1)*m;

%using m,k,b values to estimate ycap
[t,ycap] = ode45(@(t,y) syst1(t,y), tspan, [y0 yon0]);

%Plotting the Simulation
figure(1);
plot(t,y(:,1),'-');
hold on;
plot(t,ycap(:,1),'-');

%Adding legend, title and x/y labels
legend('y(t)', "ycap(t)");
title('Ploting the location and the estimated location of the object');
xlabel('Time(secs)');
ylabel("y(t),ycap(t) (m)");


%Plotting the error between y and estimated y
figure(2);
error = y - ycap;
plot(t,error(:,1),'.');
legend('Error(t)');
title('Ploting the error between y(t) and estimated y(t)');
xlabel('Time(secs)');
ylabel("Error(m)");

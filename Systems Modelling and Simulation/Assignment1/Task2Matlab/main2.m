%Clearing variables and figures
clear;
clf;

%Setting the parameters as global so we can use them in the system function
global RC LC;

%creating values for t. Spliting 1 to 10 in 10001 equal spans.
t = linspace(0,10,101);
[VR, VC] = v(t);

%setting the values for lamda in L(s)
lamda1 = 3;
lamda2 = 2;
%lamda1=3 and lamda2 = 2 means pole1 = 1 and pole2 = 2

%Creating the matrix for the values of u1 and u2
u1 = 2*sin(4*t)';
u2 = 4*ones(length(t),1);

% Using the transform function to create phi matrix collumn by collumn
phi1 = lsim(tf([-1 0],[1 lamda1 lamda2]),VC,t);     
phi2 = lsim(tf(-1,[1 lamda1 lamda2]),VC,t);         
phi3 = lsim(tf([1 0],[1 lamda1 lamda2]),u1,t);      
phi4 = lsim(tf(1,[1 lamda1 lamda2]),u1,t);
phi5 = lsim(tf([1 0],[1 lamda1 lamda2]),u2,t);
phi6 = lsim(tf(1,[1 lamda1 lamda2]),u2,t);

%Initializing the matrix with zeroes
phi = zeros(length(t),6);
%filling the matrix
phi(:,1) = phi1;
phi(:,2) = phi2;
phi(:,3) = phi3;
phi(:,4) = phi4;
phi(:,5) = phi5;
phi(:,6) = phi6;


% Finding theta based on the mathematical analysis done in the pdf
sumT = phi.'*phi;
sumVc = VC*phi;
theta0 = sumVc/sumT;

%finding values for R*C and L*C
RC = 1/(theta0(1)+lamda1);
LC = 1/(theta0(2)+lamda2);


% Simulation with values for RC, LC and VC(1) using ode45
[tT,ycap] = ode45(@(time,y) syst2(time,y),t,[VC(1) 0]);

% getting the estimates for VC and VR
VCcap = ycap(:,1)';
VRcap = u1'+u2'-VCcap;

%calculating the error values
VCerror = VC - VCcap;
VRerror = VR - VRcap;

%Plotting the data
%Plotting Vc and Vccap
figure(1);
plot(t,VC);
hold on;
plot(t,VCcap);
hold on;
legend('VC', "VCcap");
title('VC and VCcap');
xlabel('Time(secs)');
ylabel("Voltage(V)");

%Plotting error for Vc
figure(2);
plot(t,VCerror);
legend('VCerror');
title('VCerror: VC and VCcap difference');
xlabel('Time(secs)');
ylabel("Voltage(V)");

%Plotting VR and VRcap
figure(3);
plot(t,VR);
hold on;
plot(t,VRcap);
hold on;
legend('VR', "VRcap");
title('VR and VRcap');
xlabel('Time(secs)');
ylabel("Voltage(V)");

%Plotting error for VR
figure(4);
plot(t,VRerror);
legend('VRerror');
title('VRerror: VR and VRcap difference');
xlabel('Time(secs)');
ylabel("Voltage(V)");




%b)we have to do the same procedure but this time we add some high values
%in three random times
%we get three random t values 1 to length of t
randt = round(rand(3,1)*length(t));

%we assign the value of 50 for both VC and VR at those t's
VC(randt(1)) = 50;
VC(randt(2)) = 50;
VC(randt(3)) = 50;
VR(randt(1)) = 50;
VR(randt(2)) = 50;
VR(randt(3)) = 50;

% Using the transform function to create the new phi matrix collumn by collumn
phi1 = lsim(tf([-1 0],[1 lamda1 lamda2]),VC,t);     
phi2 = lsim(tf(-1,[1 lamda1 lamda2]),VC,t);         
phi3 = lsim(tf([1 0],[1 lamda1 lamda2]),u1,t);      
phi4 = lsim(tf(1,[1 lamda1 lamda2]),u1,t);
phi5 = lsim(tf([1 0],[1 lamda1 lamda2]),u2,t);
phi6 = lsim(tf(1,[1 lamda1 lamda2]),u2,t);

%Filling the matrix with the new collumns
phi(:,1) = phi1;
phi(:,2) = phi2;
phi(:,3) = phi3;
phi(:,4) = phi4;
phi(:,5) = phi5;
phi(:,6) = phi6;

% Finding the new theta
sumT = phi.'*phi;
sumVc = VC*phi;
theta1 = sumVc/sumT;

%Finding the new RC and LC values
RC = 1/(theta1(1)+lamda1);
LC = 1/(theta1(2)+lamda2);

% Simulation with the new values for RC, LC and VC(1) using ode45
[tT,ycap2] = ode45(@(time,y) syst2(time,y),t,[VC(1) 0]);

% getting the estimates for VC and VR
VCcap = ycap2(:,1)';
VRcap = u1'+u2'-VCcap;

%calculating the error values
VCerror = VC - VCcap;
VRerror = VR - VRcap;

%Plotting the new figures
%VC VCcap comparison
figure(5);
plot(t,VC);
hold on;
plot(t,VCcap);
hold on;
legend('VC', "VCcap");
title('VC and VCcap');
xlabel('Time(secs)');
ylabel("Voltage(V)");

%VC error
figure(6);
plot(t,VCerror);
legend('VCerror');
title('VCerror: VC and VCcap difference');
xlabel('Time(secs)');
ylabel("Voltage(V)");

%VR VRcap comparison
figure(7);
plot(t,VR);
hold on;
plot(t,VRcap);
hold on;
legend('VR', "VRcap");
title('VR and VRcap');
xlabel('Time(secs)');
ylabel("Voltage(V)");

%VR error
figure(8);
plot(t,VRerror);
legend('VRerror');
title('VRerror: VR and VRcap difference');
xlabel('Time(secs)');
ylabel("Voltage(V)");

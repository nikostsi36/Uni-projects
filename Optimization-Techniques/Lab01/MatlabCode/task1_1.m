clear all;
syms x;
f1 = (x-2)^2 + x*log(x+3);
f2 = 5^x + (2-cos(x))^2;
f3 = exp(x)*(x^3-1) + (x-1)*sin(x);

e(1) = 0.0001;
l = 0.01;

%here we choose for what function to run
f = f3;
%for 98 values for e, starting from 0.0001 and adding 0.00005 each
%iteration
for i = 1:98  
    [ak,bk, k(i)] = dixotomos(f, e(i), l, -1, 3);
    if i<98
        e(i+1) = e(i) + 0.00005;
    end
end
%2*k because the we calculate f two times in each iteration
plot(e,2*k);
title('f3(x)','FontSize',20)
xlabel('Epsilon','FontSize',15) 
ylabel('Number of calculations','FontSize',15) 



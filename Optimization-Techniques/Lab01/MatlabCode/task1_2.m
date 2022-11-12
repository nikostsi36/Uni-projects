clear all;
syms x;
f1 = (x-2)^2 + x*log(x+3);
f2 = 5^x + (2-cos(x))^2;
f3 = exp(x)*(x^3-1) + (x-1)*sin(x);

l(1) = 0.003;
e = 0.001;
%here we choose for what function to run
f = f3;
%for 1000 values for l, starting from 0.003 and adding 0.0005 each
%iteration
for i = 1:1000  
    [ak,bk, k(i)] = dixotomos(f, e, l(i), -1, 3);
    if i<1000
        l(i+1) = l(i) + 0.0005;
    end
end

%2*k because the we calculate f two times in each iteration
plot(l, 2*k);
title('f3(x)','FontSize',20);
xlabel('Lamda','FontSize',15); 
ylabel('Number of calculations','FontSize',15);
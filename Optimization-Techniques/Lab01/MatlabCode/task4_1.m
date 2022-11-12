clear all;
syms x;
f1 = (x-2)^2 + x*log(x+3);
f2 = 5^x + (2-cos(x))^2;
f3 = exp(x)*(x^3-1) + (x-1)*sin(x);

l(1) = 0.003;
e = 0.001;

for i = 1:100  
    [ak,bk, k(i)] = bisWithDerivative(f1, l(i), -1, 3);
    if i<100
        l(i+1) = l(i) + 0.0005;
    end
end

%2 because the we calculate f once in each iteration
plot(l, k);
title('f1(x)','FontSize',20);
xlabel('Lamda','FontSize',15); 
ylabel('Number of calculations','FontSize',15);
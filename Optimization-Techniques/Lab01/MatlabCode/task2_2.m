clear all;
syms x;
f1 = (x-2)^2 + x*log(x+3);
f2 = 5^x + (2-cos(x))^2;
f3 = exp(x)*(x^3-1) + (x-1)*sin(x);

e = 0.001;
l = 0.5;

for i = 1:100  
    [a(:,i), b(:,i), k(i)] = goldenSection(f1, l, -1, 3);

end

plot(a);
hold on;
plot(b);
title('f1(x): l=0.5','FontSize',20);
xlabel('Kappa','FontSize',15); 
ylabel('Values for a and b ','FontSize',15);
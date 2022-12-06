syms x;
syms y;
%we plot f by taking 10000 values of it (100 x's and 100 y's with all their
%combinations and then we mesh them as a grid
x = linspace(-4,4,100);                                                   
y = x';                                                   
f = x.^5.* exp(-x.^2-y.^2);

surf(x, y, f)

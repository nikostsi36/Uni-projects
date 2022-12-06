clear all;
syms xx yy;

f(xx,yy) = xx^5 * exp(-xx^2-yy^2) ;
grad = gradient(f, [xx, yy]) ;

xstart = 1;
ystart = -1;
e = 0.0001;
gamma = 0.2;
[x, y, k] = steepest_descent_min(xstart,ystart,e,gamma,grad,f);
figure;
plot(x);
xlabel('Iterations: k') 
ylabel('x progression') 
figure;
plot(y);
xlabel('Iterations: k') 
ylabel('y progression') 
value = x(k)^5 * exp(-x(k)^2-y(k)^2);
disp('min = ');
disp(value);
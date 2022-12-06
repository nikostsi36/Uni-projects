clear all;
syms xx yy;

f(xx,yy) = xx^5 * exp(-xx^2-yy^2) ;
grad = gradient(f, [xx, yy]) ;
hess = hessian(f, [xx, yy]) ;

%0.1/-0.1
xstart = 1;
ystart = -1;
e = 0.0001;
gamma = 0.2;
[x, y, m, k] = LevMarq_armijo(xstart,ystart,e,gamma,grad,hess,f);
plot(k);
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
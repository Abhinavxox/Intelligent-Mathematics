A=[1 2 1; 1 1 1;2 3 3];
[u v] = eig(A);
v
u

n=size(A);
n=n(2);

xold= [ones(n,1)];

xvec= xold;

for k = 2:10
    xnew= A*xold
    lam(k)= xnew(1)
    xnew= xnew/lam(k)
    xvec(:,k)= xnew;
    xold=xnew;
end
lam
xvec

A*xvec(:,k)
lam(k)*xvec(:,k)

disp("To get the eigen values (Corresoding to first column eigen vector): ");
x=u(:,1);
(x'*A*x)/(x'*x)

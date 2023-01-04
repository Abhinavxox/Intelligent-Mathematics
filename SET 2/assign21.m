
m = 0.5;
c = 5;
x = -5:0.01:5;
y = m*x + c;
plot(x,y);
gauss = sqrt(0.1)*randn(length(y),1);
y_noisy = y' + gauss;

one = ones(length(y),1);
A = cat(2,x',one);
theta = pinv(A)*(y_noisy);
mc = theta(1);
cc = theta(2);
y_pred = mc*x + cc;
scatter(x,y_noisy,'.r');
hold on;
scatter(x,y_pred,'.b');

MSE_train = immse(y_noisy,y_pred);
disp(MSE_train);

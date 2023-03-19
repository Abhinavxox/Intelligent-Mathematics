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

%fitting a parabola
a = 1;
b = 2;
c = 5;
x = -5:0.01:5;
x = x';
y = a*x.^2+b*x+c;
sigma = 1;
scatter(x,y,'.r');hold on;
y_noise = y + sigma*randn(length(y),1);% gives standard values for mean deviation 0 and sigma one to cange enter values of sigma
A = [x.^2 x ones(length(y),1)];
theeta = pinv(A)*y_noise;
ac = theeta(1);
bc = theeta(2);
cc = theeta(3);
scatter(x,y_noise,'.green');
yc = ac*x.^2+bc*x+cc;
scatter(x,yc,'.k')
error = y - yc;
squared_error = error.^2;
mse = mean(squared_error); %mean squared error
disp("MSE= "+mse)
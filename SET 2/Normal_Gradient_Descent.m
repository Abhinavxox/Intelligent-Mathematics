%question 3
function testCGD()
    clear all; close all; clc; 
    xo=[randi(10); randi(10)];

    A=[1 2; 2 5]; b=[0;1];

    x1=-10:.1:10;
    x2=-10:.1:10;
    [X1,X2] = meshgrid(x1,x2);
    Z = (1/2)*X1.^2+2*X1.*X2+(5/2)*X2.^2-X2+4;
    contour (X1,X2,Z, 30);

    Tx = inv(A)*b;

    [xn, i] = normalGD(A, xo, b); 
    i
    [Tx xn]
end

function [xn, i] = normalGD(A, xo, b)
    xa=xo; 
    for i=1:inf
        g=A*xo-b; 
        alpha=g'*g/(g'*A*g); 
        xn=xo-alpha*g;
        xa=[xa xn];
        xo = xn;
        errnorm=norm(A*xn-b,2);
        if errnorm <0.001 
            break;
        end
    end 
    hold on
    plot(xa(1, :) ,xa(2,: ));
    hold on
    plot(xa(1, :),xa (2, :), '*');
    axis equal 
end
%question 4
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

    [xn, i] = CGD(A, xo, b); 
    i
    [Tx xn]
end

function [xn, i] = CGD(A, xo, b)
    xa=xo; 

    g=A*xo-b;
    if (norm(g, 2) < 0.001)
        xn = xo; return;
    else
        d = -g;
    end 
    for i=1:length(xo)
        alpha=-g'*d/(d'*A*d); 
        xn=xo+alpha*d;
        xa=[xa xn]; 
        xo=xn;
        g = A*xo-b;
        if (norm(g, 2) < 0.001)
            break;
        end
        Bn = (g'*A*d)/(d'*A*d);
        d = -g + Bn * d;
    end 
    hold on
    plot (xa(1, :),xa(2, :)); 
    hold on
    plot(xa(1, :),xa(2,:),'*');
    axis equal 
end
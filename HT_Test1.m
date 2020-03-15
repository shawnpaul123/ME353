%eqn 1 of steady - left side of fin base


close all;
clear all;
clc;

d_x = 0.5;
d_y = 0.5;
m=19;%i
n=13;%j
w=m*d_x;%i
h=n*d_y;%j

x = linspace(0,w,m);
y = linspace(0,h,n);

T = zeros(m,n);

%{
T(1,1:n) = 100;%Top
T(n,1:n) = 300;%Bottom
T(1:n,1) = 500;%Left
T(1:n,n) = 200;%Right
%}

T(1,1:n) = 110;%Top
T(m,1:3) = 20;%Side Bottom
T(m,11:13) = 20;%Side Top
tol = 1e-6;
error = 1;
k=0;

while error > tol
    k=k+1
    if k > 150%limit on for loop iterations
        break
    end
    Told = T
        for i = 2:m-1;
            for j = 2:n-1;
                T(i,j) = 0.25* (T(i,j-1) + T(i-1,j) + T(i+1,j) + T(i,j+1));
            end
        end
       
        error = max(max(abs(Told-T)));
end


subplot(3,1,1),contour(T),colormap
title('Temperature (Steady State)'),xlabel('x'),ylabel('y'),colorbar

subplot(3,1,2),pcolor(T),shading interp,
title('Temperature(Steady State)'),xlabel('x'),ylabel('y'),colorbar
subplot(3,1,3)
surf(T)
    xlabel('x')
    ylabel('y')
    zlabel('T')
    colorbar

   
    

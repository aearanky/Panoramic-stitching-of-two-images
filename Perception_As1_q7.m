clc;
clear all;
I=[ 9  10  9  4  3 ;...
    5   7  8  9  3;...
    4   5  6  8  5;...
    3   4  5  6  8;...
    2   3  4  5  6];
imshow(I);

% a) i)Gaussian
G=(1/16)*[1 2 1; 2 4 2; 1 2 1];
I_G = round(imfilter(I,G),0);
figure;
imshow(I_G);

% a)ii)Box blur
B =(1/9)*eye(3); 
I_B = imfilter(I,B);
figure;
imshow(I_B);

%b)Sobel Edge detection
S1 = (1/8)*[-1 0 1;-2 0 2;-1 0 1];
S2 = (1/8)*[ 1 2 1; 0 0 0; -1 -2 -1];
I_C_S1 = (I(2:4,2:4))'.*S1;
fx=0;
for i=1:3
    for j=1:3
        fx = fx + I_C_S1(i,j);
    end
end

fy=0;
I_C_S2 = (I(2:4,2:4))'.*S2;
for i=1:3
    for j=1:3
        fy = fy + I_C_S2(i,j);
    end
end

Gradient_magnitude = sqrt(fx^2+fy^2);
Gradient_angle = atan(fx/fy);
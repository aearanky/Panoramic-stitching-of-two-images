clear all;
Kf = [1 0 0; 0 1 0; 0 0 1];
C = [0; 0; -3];
R = [cos(-pi/4) 0 sin(-pi/4);0 1 0; -sin(-pi/4) 0 cos(-pi/4)];
I = eye(3);
Points = [0 -0.5 0 1;1 -0.5 0 1; 1 -0.5 1 1;0 -0.5 1 1;0 0.5 0 1; 1 0.5 0 1; 1 0.5 1 1; 0 0.5 1 1];
Points = transpose(Points);

%Camera Matrix
P = Kf*R*[I -C];

% Fifth point
Homo_Points5 = P * Points(:,5);
Non_homo_points5 = [Homo_Points5(1)/Homo_Points5(3);...
    Homo_Points5(2)/Homo_Points5(3);...
    Homo_Points5(3)/Homo_Points5(3)] ; 
% Sixth point
Homo_Points6 = P * Points(:,6);
Non_homo_points6 = [Homo_Points6(1)/Homo_Points6(3);...
    Homo_Points6(2)/Homo_Points6(3);...
    Homo_Points6(3)/Homo_Points6(3)] ;
% Seventh point
Homo_Points7 = P * Points(:,7);
Non_homo_points7 = [Homo_Points7(1)/Homo_Points7(3);...
    Homo_Points7(2)/Homo_Points7(3);...
    Homo_Points7(3)/Homo_Points7(3)] ;
% Eighth point
Homo_Points8 = P * Points(:,8);
Non_homo_points8 = [Homo_Points8(1)/Homo_Points8(3);...
    Homo_Points8(2)/Homo_Points8(3);...
    Homo_Points8(3)/Homo_Points8(3)] ;

%Vanishing point of the line P5P7
Vp5p7 =round(P*(Points(:,7)-Points(:,5)),4);



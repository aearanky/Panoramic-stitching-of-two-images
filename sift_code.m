clc
clear
I1 = imread('C:/Users/Aditya Earanky/Pictures/WhiteSquare.jpg');
I1 = single(I1);
imshow(I1);
[f1,d1] = vl_sift(I1);

perm = randperm(size(f1,2)) ;
sel = perm(1:29) ;
h1 = vl_plotframe(f1(:,sel)) ;
h2 = vl_plotframe(f1(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;

% --------------------------------------------------------------------------


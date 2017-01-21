clc
clear
I2 = imread('C:/Users/Aditya Earanky/Pictures/Mosaic_Perception_Q3_part2.png');
 imshow(I2);
I2 = single(rgb2gray(I2));
[f2,d2] = vl_sift(I2);

perm = randperm(size(f2,2)) ;
sel = perm(1:379) ;
h1 = vl_plotframe(f2(:,sel)) ;
h2 = vl_plotframe(f2(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','r','linewidth',0.5) ;
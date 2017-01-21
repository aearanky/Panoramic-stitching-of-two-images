%% -------------- Solution for Question 8----------------
clc
clear
PathForImage1='C:/Users/Aditya Earanky/Pictures/Mosaic_Perception_Q3_part1.png';
PathForImage2 = 'C:/Users/Aditya Earanky/Pictures/Mosaic_Perception_Q3_part2.png'; 
I1 = imread(PathForImage1);
I2 = imread(PathForImage2);

%% ---------------Solution for question 4-------------
[f1,f2,f3,f4,SortedMatches,Matches]=find_best_match2(I1,I2);
 
%% ---------------Solution for question 5-------------
x1 = f3((1:2),:); %(x1,y1) of Features from image 1
x2 = f4((1:2),:); %(x2,y2) of Features from image 2
AffineBestMatch = affine_transformation(x1,x2);

%% ---------------Solution for question 6-------------
SortedRANSACMAtrix=RANSAC(SortedMatches);

%% --------------Solution for question 7--------------
AffineRANSAC = SortedRANSACMAtrix{end,1};
I1=rgb2gray(I1);
I2=rgb2gray(I2);
[StitchedImage,TransformedPixelLocationsI2]=stitch2(I1,I2,AffineRANSAC);
figure;
imshow(StitchedImage);
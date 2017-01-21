% function [StitchedImage,TransfLocI2] = stitch(I1,I2,Affine)
clc
PathForImage1='C:/Users/Aditya Earanky/Pictures/Mosaic_Perception_Q3_part1.png';
PathForImage2 = 'C:/Users/Aditya Earanky/Pictures/Mosaic_Perception_Q3_part2.png'; 
I1 = rgb2gray(imread(PathForImage1));
I2 = rgb2gray(imread(PathForImage2));

sizeI2 = size(I2);
r=sizeI2(1,1);
c=sizeI2(1,2);
PixelLocI2 = zeros(3,r*c);
k=1;
for i=1:r
    for j=1:c
       PixelLocI2(:,k) = [i;j;1];
       k=k+1;
    end
end

Affine = AffineBestMatch2;
% Affine = AffineRANSAC;
PixelLocI2 = floor(Affine*PixelLocI2);

% Stitching the Images
LastX=PixelLocI2(1,r*c)%Height of the image
LastY=PixelLocI2(2,r*c)%Width of the image

StitchedImage = zeros(LastX,LastY);
%------visited-----
for i=1:LastX
    for j=1:LastY
            a=[i;j;1];
            b=Affine\a;
            PosX=ceil(b(1,1));
            PosY=ceil(b(2,1));
            if ((PosX>0 && PosY>0) && (PosX<301 && PosY<401))
                StitchedImage(i,j) = I2(PosX,PosY);
            else
                StitchedImage(i,j) = 0;
            end
    end
end

StitchedImage = StitchedImage';
StitchedImage = mat2gray(StitchedImage);
figure;
imshow(StitchedImage);
% StitchedImage(1:300,1:400) = StitchedImage(1:300,1:400) + mat2gray(I1);%1:300,1:400

for i=1:300
    for j=1:400
        if StitchedImage(i,j)== 0;
            StitchedImage(i,j) = StitchedImage(i,j) + mat2gray(double(I1(i,j))/255);%1:300,1:400
        end
    end
end
    figure;imshow(StitchedImage);
% end
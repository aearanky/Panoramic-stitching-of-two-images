% Affine transformation from Image2 to Image1
function A = affine_transformation2(x1,x2)

Image1 = [x1(1,1); x1(2,1);...
           x1(1,2) ;x1(2,2);...
            x1(1,3) ;x1(2,3)];
      
  
 Image2 =[x2(1,1) x2(2,1) 0  0  1  0;...
            0  0  x2(1,1) x2(2,1) 0 1;...
            x2(1,2) x2(2,2) 0  0  1  0;...
            0  0  x2(1,2) x2(2,2) 0 1;... 
            x2(1,3) x2(2,3) 0 0 1 0;...
            0  0 x2(1,3) x2(2,3) 0 1]; 
 
        a = Image2\Image1 ; 
%  
 A = round([a(1,1) a(2,1) a(5,1);...
            a(3,1) a(4,1) a(6,1);...
            0      0      1],5);

 A = round([a(2,1) a(1,1) a(5,1);...
            a(4,1) a(3,1) a(6,1);...
            0      0      1],5)

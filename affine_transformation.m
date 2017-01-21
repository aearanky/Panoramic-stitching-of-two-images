% Affine transformation from Image2 to Image1
function A = affine_transformation(x1,x2)
x1 = [x1; 1 1 1];
x2 = [x2; 1 1 1];
%x't = xt * At
A_transpose = inv(transpose(x2))*transpose(x1);
A = round(transpose(A_transpose),5);   
end
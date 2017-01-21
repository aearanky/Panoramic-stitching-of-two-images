function [A,count] = RANSAC2(SortedMatches)
K=size(SortedMatches);
N = K(1);
%Calculate Affine
Select3Features = SortedMatches(randi([1,N],1,3),:)%N
x1 = transpose(Select3Features(:,(4:5)))
x2 = transpose(Select3Features(:,(2:3)))
A = affine_transformation2(x1,x2)

% Affine Transformation to locations of first N features (x,y) in Image2
I2FeatureXY = zeros(3,N);
for i = 1:N
   I2FeatureXY(:,i) = [transpose(SortedMatches(i,(2:3)));1];
end
I2FeatureXY = A* I2FeatureXY;

I1FeatureXY = zeros(3,N);
for i = 1:N
   I1FeatureXY(:,i) = [transpose(SortedMatches(i,(4:5)));1];
end
% Check if the points matched -> Eucledan distance < 2
count = 0;
for k=1:N
    CheckSum = norm(I1FeatureXY(:,k)-I2FeatureXY(:,k));
    if CheckSum <=2 
       count = count+1;
    end  
end
end 
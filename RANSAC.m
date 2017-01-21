function SortedRANSACMAtrix = RANSAC(SortedMatches)
RANSACMatrix = cell([10 2]);
K=size(SortedMatches);
N = K(1);
for m=1:1000
    %Calculate Affine
    Select3Features = SortedMatches(randi([1,N],1,3),:);
    %     Select3Features = SortedMatches((1:3),:);
    x1 = transpose(Select3Features(:,(4:5)));
    x2 = transpose(Select3Features(:,(2:3)));
    A = affine_transformation(x1,x2);
    
    % Affine Transformation to all pixels of Image2
    PixelLocI2 = zeros(3,N);
    for i = 1:N
        PixelLocI2(:,i) = [transpose(SortedMatches(i,(2:3)));1];
    end
    PixelLocI2 = A* PixelLocI2;
    
    PixelLocI1 = zeros(3,N);
    for i = 1:N
        PixelLocI1(:,i) = [transpose(SortedMatches(i,(4:5)));1];
    end
    
    % Check if the points matched -> Eucledan distance < 2
    count = 0;
    for k=1:N
        CheckSum = norm(PixelLocI1(:,k)-PixelLocI2(:,k));
        if CheckSum <=2
            count = count+1;
        end
    end
    RANSACMatrix{m,1} = A;
    RANSACMatrix{m,2} = count;
end
SortedRANSACMAtrix=sortrows(RANSACMatrix,2);
end
function [f1,f2,f3,f4,SortedMatches] = find_best_match(I1,I2)

I3 = single(rgb2gray(I1));
[f1,d1] = vl_sift(I3);
s1 = size(f1);

I4 = single(rgb2gray(I2));
[f2,d2] = vl_sift(I4);
s2 = size(f2);

 d1 = double(d1);
 d2 = double(d2);
%  135303  143641

Matches =zeros(135303,3);
z = 1;
for i = 1:s2(1,2) %Image2
    for j = 1:s1(1,2) %Image1
        sum = 0;
        for k =1:128
             sum = sum+ (d2(k,i)-d1(k,j)).^2;
        end
        Matches(z,1:3) = [sum i j];
        z=z+1;
    end    
end

SortedMatches = sortrows(Matches,1);
FirstThree = SortedMatches((1:3),:);

f3 = f1(:,FirstThree(1,3));
for i = 2:3
   f3 = [f3 f1(:,FirstThree(i,3))];
end

f4 = f2(:,FirstThree(1,2));
for i = 2:3
   f4 = [f4 f2(:,FirstThree(i,2))];
end
% ----------------------------------------------------------------
perm = [1 2 3];
color = ['w' 'g' 'b'];
% ----------------------------------------------------------------
imshow(I1);
for i =1:3
   sel = perm(i) ;
    h1 = vl_plotframe(f3(:,sel)) ;
    h2 = vl_plotframe(f3(:,sel)) ;
    set(h1,'color','k','linewidth',3) ;
    set(h2,'color',color(i),'linewidth',0.5) ; 
end
% ---------------------------------------------------
figure;
imshow(I2);
for i =1:3
   sel = perm(i) ;
    h1 = vl_plotframe(f4(:,sel)) ;
    h2 = vl_plotframe(f4(:,sel)) ;
    set(h1,'color','k','linewidth',3) ;
    set(h2,'color',color(i),'linewidth',0.5) ; 
end

end
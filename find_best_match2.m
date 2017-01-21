function [f1,f2,f3,f4,SortedMatches,Matches] = find_best_match2(I1,I2)

I3 = single(rgb2gray(I1));
[f1,d1] = vl_sift(I3);
s1 = size(f1);

I4 = single(rgb2gray(I2));
[f2,d2] = vl_sift(I4);
s2 = size(f2);

d1 = double(d1);
d2 = double(d2);

Matches =zeros(s2(1,2),3);
sum1(s2(1,2))=0;

for i = 1:s2(1,2) %No. of Image2 features
    sum1(1)=0;
    for j = 1:s1(1,2) %No. of Image1 features
        d=d2(:,i)-d1(:,j);
        sum1(j) = sum(d.^2);
        if j==1
            MinSum = sum1(j);
            Matches(i,1:3) = [MinSum i j];
        end
        if j>1
            if sum1(j)<MinSum
                MinSum=sum1(j);
                Matches(i,1:3) = [MinSum i j];
            end
        end
    end
end

SortedMatchesColumns = sortrows(Matches,1);

SortedMatches = zeros(s2(1,2),5);
for i=1:s2(1,2)
    SortedMatches(i,:) = [SortedMatchesColumns(i,1)...
        f2(1,SortedMatchesColumns(i,2)) f2(2,SortedMatchesColumns(i,2))...
        f1(1,SortedMatchesColumns(i,3)) f1(2,SortedMatchesColumns(i,3))];
end

First3Rows = SortedMatchesColumns((1:3),:);

f3 = f1(:,First3Rows(1,3));
for i = 2:3
    f3 = [f3 f1(:,First3Rows(i,3))];
end

f4 = f2(:,First3Rows(1,2));
for i = 2:3
    f4 = [f4 f2(:,First3Rows(i,2))];
end

perm = [1 2 3];
color = ['w' 'g' 'b'];

imshow(I1);
for i =1:3
    sel = perm(i) ;
    h1 = vl_plotframe(f3(:,sel)) ;
    h2 = vl_plotframe(f3(:,sel)) ;
    set(h1,'color','k','linewidth',3) ;
    set(h2,'color',color(i),'linewidth',0.5) ;
end

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
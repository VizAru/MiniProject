clc;
close all;

I2=imread('9.png');
cc=bwconncomp(I2,8);
n=cc.NumObjects;

Area = zeros(1,n);
%Perimeter = zeros(1,n);
%MajorAxis = zeros(n,1);
%MinorAxis = zeros(n,1);

k = regionprops(cc,'Area');

for i = 1:n
    %lung = false(size(I2));
    %lung(cc.PixelIdxList(i)) = true;
    %figure(i);
    %imshow(lung);
    Area(i)= k(i).Area;
    %Perimeter(i) = k(i).Perimeter;
    %MajorAxis(i) = k(i).MajorAxisLength;
    %MinorAxis(i) = k(i).MinorAxisLength;
end
dlmwrite('test.csv',Area,'delimiter',',','-append');
%data(1,1) = mean(Area);
%data(2,1) = mean(Perimeter);
%data(3,1)= mean(MajorAxis);
%data(4,1) = mean(MinorAxis);
    
    

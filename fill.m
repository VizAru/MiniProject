bw=imread('1_1.png');
croppedImage = bw(110:750, 100:940);
bw2=bwareafilt(croppedImage,2);
%imshow(bw2);
%croppedImage = bw2();
imshow(bw2);
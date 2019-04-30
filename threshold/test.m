im=imread('pneumonia (1).png');
imhist(im);
%im=rgb2gray(im);
b=imbinarize(im);
imshow(b);
probplot('normal',im);

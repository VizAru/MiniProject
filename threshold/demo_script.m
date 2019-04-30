

% User has the Image Processing Toolbox.
% Continue with the demo.  Do some initialization stuff.
clc;    % Clear command window.
clear;  % Delete all variables.
workspace;      % Make sure the workspace panel is showing.
fontSize = 20;


grayImage = imread('pneumonia (1).png');
% Get the dimensions of the image.  numberOfColorBands should be = 1.
[rows, columns, numberOfColorBands] = size(grayImage);

% Display the original gray scale image.
subplot(2, 3, 1);
imshow(grayImage, []);
axis off;
title('Original Grayscale Image', 'FontSize', fontSize);
% Set up figure properties.
set(gcf, 'Name', 'Thresholding Demo by ImageAnalyst', 'NumberTitle', 'off') 
set(gcf, 'Toolbar', 'none', 'Menu', 'none');
set(gcf, 'Position', get(0,'Screensize')); % Enlarge figure to full screen.


	imageToThreshold = grayImage;
	startingLowThreshold = 80;
	startingHighThreshold = 255;
	
	


%====================== KEY PART RIGHT HERE!!!! ===================================================
% Threshold with starting range startingLowThreshold to startingHighThreshold.
[lowThreshold, highThreshold] = threshold(startingLowThreshold, startingHighThreshold, imageToThreshold);
%====================== KEY PART RIGHT HERE!!!! ===================================================


% Place vertical red bars over the histogram at the threshold locations.
hold on;
yAxisLimits = ylim();
line([lowThreshold, lowThreshold], yAxisLimits, 'Color', 'r', 'LineWidth', 2);
line([highThreshold, highThreshold], yAxisLimits, 'Color', 'r', 'LineWidth', 2);
caption = sprintf(' Low Threshold = %.1f', lowThreshold);
text(lowThreshold, 0.7*yAxisLimits(2), caption, 'Color', 'r', 'FontWeight', 'Bold', 'FontSize', 15);
caption = sprintf(' High Threshold = %.1f', highThreshold);
text(highThreshold, 0.9*yAxisLimits(2), caption, 'Color', 'r', 'FontWeight', 'Bold', 'FontSize', 15);

% Binarize the image.
binaryImage = (imageToThreshold > lowThreshold) & (imageToThreshold < highThreshold);
subplot(2, 3, 3);
imshow(binaryImage, []);
axis off;
title('Binary Image', 'FontSize', fontSize);
















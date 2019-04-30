% Compute max and min of the original image.
minValue = min(imageToThreshold(:));
maxValue = max(imageToThreshold(:));

% Make the image inside the mask have a value of zero.
maskedImage = imageToThreshold;
maskedImage(binaryImage) = 0;
subplot(4, 3, 7);
imshow(maskedImage, []);
axis off;
title('Zero Value Inside the Mask', 'FontSize', fontSize);

% Make the image inside the mask have the min value.
maskedImage = imageToThreshold;
maskedImage(binaryImage) = minValue;
subplot(4, 3, 8);
imshow(maskedImage, []);
axis off;
caption = sprintf('Min Value (%.1f) Inside the Mask', minValue);
title(caption, 'FontSize', fontSize);

% Make the image inside the mask have the max value.
maskedImage = imageToThreshold;
maskedImage(binaryImage) = maxValue;
subplot(4, 3, 9);
imshow(maskedImage, []);
axis off;
caption = sprintf('Max Value (%.1f) Inside the Mask', maxValue);
title(caption, 'FontSize', fontSize);

% Now do the same thing but OUTSIDE the mask.
outsideMask = ~binaryImage;

% Make the image outside the mask have a value of zero.
maskedImage = imageToThreshold;
maskedImage(outsideMask) = 0;
subplot(4, 3, 10);
imshow(maskedImage, []);
axis off;
title('Zero Value Outside the Mask', 'FontSize', fontSize);

% Make the image outside the mask have the min value.
maskedImage = imageToThreshold;
maskedImage(outsideMask) = minValue;
subplot(4, 3, 11);
imshow(maskedImage, []);
axis off;
caption = sprintf('Min Value (%.1f) Outside the Mask', minValue);
title(caption, 'FontSize', fontSize);

% Make the image outside the mask have the max value.
maskedImage = imageToThreshold;
maskedImage(outsideMask) = maxValue;
subplot(4, 3, 12);
imshow(maskedImage, []);
axis off;
caption = sprintf('Max Value (%.1f) Outside the Mask', maxValue);
title(caption, 'FontSize', fontSize);
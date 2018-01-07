function featurePoints = detectFeaturePoints(origI)
%
I = histeq(origI);
I = double(I);
colorDistance = sqrt((I(:,:,1)-255).^2 ...
    +(I(:,:,2)-0).^2 ...
    +(I(:,:,3)-0).^2)/255;
BW = imbinarize(colorDistance, 0.35);
BW = medfilt2(~BW, [10 10]);
B = bwboundaries(BW, 'noholes');
featurePoints = zeros(length(B),2);
for k = 1:length(B)
    boundary = B{k};
    featurePoints(k,2) = median(boundary(:,1));
    featurePoints(k,1) = median(boundary(:,2));
end

figure
I = uint8(I);
imshow(I);
title('Enhanced Image');
figure
imshow(BW);
title('Binarized Image');
% figure
% subplot(1,3,1)
% imshow(origI);
% title('Original Image');
% subplot(1,3,2)
% I = uint8(I);
% imshow(I);
% title('Enhanced Image');
% subplot(1,3,3)
% imshow(BW);
% title('Binarized Image');

% subplot(1,4,4)
% imshow(origI);
% hold on
% plot(featurePoints(:,1), featurePoints(:,2), 'yo');
% hold off



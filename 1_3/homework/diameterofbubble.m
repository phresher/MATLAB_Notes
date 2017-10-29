I = imread('cavBubble.png');
figure
imshow(I);
% exchange to two-value image
bw1 = imbinarize(I);
figure
imshow(bw1);
% fill in the hole inside
bw2 = imfill(~bw1,'holes');
figure
imshow(bw2)
title('Filled Image');
% dilation-get thinner
se = strel('sphere',15);
bw3 = imdilate(~bw2 ,se);
imshow(bw3), title('dilated');
% get thicker
bw4 = bwmorph(~bw3,'thick',15);
figure
imshow(bw4),title('aftermorph')
nPix = sum(sum(~bw2));
d = sqrt(nPix/pi)
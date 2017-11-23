vegetables = imread('vegetables.jpeg');
grayVegetables = rgb2gray(vegetables);
globalEqualization = histeq(grayVegetables);
adaptiveEqualization = adapthisteq(grayVegetables);
subplot(2,3,1)
imshow(grayVegetables);
title('Original');
subplot(2,3,2)
imshow(globalEqualization);
title('Histogram Equalized');
subplot(2,3,3)
imshow(adaptiveEqualization);
title('Adaptive Histogram Equalized');
subplot(2,3,4)
imhist(grayVegetables);
subplot(2,3,5)
imhist(globalEqualization)
subplot(2,3,6)
imhist(adaptiveEqualization)

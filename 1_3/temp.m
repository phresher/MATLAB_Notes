I = imread('vegetables.jpeg');
I2 = imresize(I, [200 200]);
imshow(I2);
imwrite(I2, 'vege.png');
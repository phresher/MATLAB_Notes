# matlab 图像处理

## 目标

输入输出图片和常用的图片格式

基本图像变换

图像增强

图像分析

## 内容

### 输入输出图片和常用的图片格式

```matlab
I = imread('vegetables.jpeg');
I2 = imresize(I, [200 200]);
imshow(I2);
imwrite(I2, 'vege.png');
```

jpeg 是照片常用的格式，压缩率可以很高，压缩有损画质；png 是一种无损压缩格式；tif 是一种位图，有丰富的功能，例如图层；bmp 是一种简单的位图格式。这些格式都是常用的。

### 基本图像变换

裁剪、旋转等

```matlab
% 用 GUI 裁剪图片
imcrop(I);
% 更多功能的图片工具，例如测距
imtool(I);
% 旋转并裁剪图片，顺时针角度值为负
J = imrotate(I,-1,'bilinear','crop');
```

颜色相关（对比度、黑白、灰度）

```matlab
% 黑白，注意阈值，看文档
BW = imbinarize(I);
% 灰度
J = rgb2gray(I);
% 调亮度、对比度
imshow(J);
imcontrast;
```

### 图像增强

丰富的滤镜

```matlab
% 高斯模糊
B = imgaussfilt(A);
% 中值滤波
B = medfilt2(A);
% 锐化
J = deconvwnr(I,PSF,NSR);
```

延伸阅读[matlab 磨皮](https://www.zhihu.com/question/27780598)

### 图像分析

边缘检测

edge 函数检测边缘

```matlab
% 不同检测方法的效果对比，请看文档
BW = edge(I);
```

bwboundaries 函数识别闭合区域

```matlab
I = imread('rice.png');
BW = edge(I);
imshow(BW);
B = bwboundaries(imbinarize(I));
imshow(B);
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
```

imfindcircles 函数，寻找给定半径的圆

查看统计信息

imhist 函数查看直方图

corr2 函数计算两张个矩阵的相关系数

更多统计图片信息的函数参见文档 Region and Image Properties

图像变换和图像压缩

离散余弦变换，dctmtx 函数，参见文档 Discrete Cosine Transform

### 家庭作业

计算 cavBubble.png 中空化泡的尺寸，以下函数或许有用：imbinarize、medfilt2、imdilate、bwmorph 和 imfill

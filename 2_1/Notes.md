# 图像增强

## 目标

了解超分辨重建的概念

试用一种超分辨率重建算法

了解传统的图像增强方法

初步认识面向对象的编程

## 内容

### 超分辨率重建概念

超分辨率技术（Super-Resolution）是指从观测到的低分辨率图像重建出相应的高分辨率图像，在监控设备、卫星图像和医学影像等领域都有重要的应用价值。SR可分为两类:从多张低分辨率图像重建出高分辨率图像和从单张低分辨率图像重建出高分辨率图像。基于深度学习的SR，主要是基于单张低分辨率的重建方法，即Single Image Super-Resolution (SISR)。

延伸阅读，[深度学习在图像超分辨率重建中的应用](https://zhuanlan.zhihu.com/p/25532538)

### 试用 SelfExSR 算法

SISR 曾是深度学习领域的热点，现在有很多现成的算法可用，我们挑一种现成的、用 Matlab 写成的算法 —— [SelfExSRC](https://github.com/jbhuang0604/SelfExSR)。

浏览上述链接，可以发现这个算法曾发表在一个会议上。计算机领域有一个通行的做法，作者将论文中的算法开源、上传到 GitHub，以增加人气，增加引用次数。在使用这个算法的过程用，请注意学习优秀的项目管理模式和编程习惯。

可以将这个 Repo folk 一份，然后 clone 刚刚 folk 的副本，也可以直接 clone 原版。课上为了节省时间，直接拷贝已经下载好的版本。

复制过程中，可以看下这个算法的[网站](https://sites.google.com/site/jbhuang0604/publications/struct_sr)，直观感受下这个算法的效果。

复制完成后，按照 README 的提示运行 demo。

用建筑照片测试该算法的效果。复制照片到适当的目录，运行类似如下代码

```matlab
startup;
filePath.dataPath    = 'data\User';
filePath.imgFileName = 'buildings.jpg';
filePath.filePath.resLvlPath = 'data\User_lvl';
opt = sr_init_opt(8);
imgHiRes = sr_demo(filePath, opt);
imgLowRes = imread([filePath.dataPath '\' filePath.imgFileName]);
subplot(1,2,1);imshow(imgLowRes);
subplot(1,2,2);imshow(imgHiRes);
```

### 传统的图像增强方法

图像增强远不止增强分辨率，上述例子只是一个展示效果好又流行的算法。还有增加对比度、消除抖动、消除噪点等等都是图像增强的范畴。

回忆一下 1.3 节讲过的滤镜，比如中值滤波等等。这节课我们看下怎么使用这些滤镜实现特定的功能。

先看如何调整对比度，阅读文档《Histogram Equalization》和《Adaptive Histogram Equalization》，并对比二者的区别。

```matlab
vegetables = imread('vegetables.jpeg');
grayVegetables = rgb2gray(vegetables);
globalEqualization = histeq(grayVegetables);
adaptiveEqualization = adapthisteq(grayVegetables);
```

用同样的思路对比 deconvwnr 和 vision.Deinterlacer 去模糊的效果。deconvwnr 是个函数， vision.Deinterlacer 是个对象，形式上两者有什么区别？家庭作业，阅读文档《Why Use Object-Oriented Design》。

先了解下什么是噪点，然后阅读文档《Noise Removal》。

## 家庭作业

用手机拍一张有抖动的照片，使用课上的方法去抖动。

用手机拍一张有噪点的照片，使用可上的方法降噪。

阅读文档《Why Use Object-Oriented Design》

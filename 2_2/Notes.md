# 特征提取和识别

## 目标

了解多种检测、提取特征的算法

了解匹配特征的算法

了解储存特征的函数

学会匹配两张图的特征点

学会在复杂场景中寻找特定物体的方法

了解 OCR 及识别验证码的一般步骤

## 内容

### 特征检测、提取、匹配及其应用

阅读文档《Local Feature Detection and Extraction》《Point Feature Types》《Local Feature Extraction》，了解 BRISK、 FAST、 Harris、 MinEigen、 MSERF、 SURF，这些函数可以检测不同类型的特征。

调用课程提供的函数 detectObjectDemo 在图片 scene.jpg 的场景中检测 cover.jpg 中的书。

```matlab
detectObjectDemo('cover.jpg', 'scene.jpg', 1);
```

### 光学字符识别（OCR）

OCR 的全称是 Optical Character Recognition，matlab 提供了一整套工具，阅读文档《Optical Character Recognition (OCR)》了解详情。

运行以下简单的示例，查看识别效果，注意文中的“in”被误判为“m”。

```matlab
img = imread('quote.jpg');
ocrDemo(img);
```

提高 OCR 的准确率一直是计算机视觉领域的热点。一些手段可以提高特定场景下识别的准确率，阅读文档《Recognize Text Using Optical Character Recognition (OCR)》和《Automatically Detect and Recognize Text in Natural Images》。

识别验证码一般要使用多种图像处理手段，对于复杂的验证码，可能无论如何都无法达到较高的准确率。但是考虑到网站允许输错后重新输入，即便识别单个验证码的正确率只有 20%，通过验证所需识别次数的期望也仅有 5。

一种通用的办法是针对某种验证码训练神经网络，阅读文档《Train Optical Character Recognition for Custom Fonts》。

### 深度学习、物体检测和识别

深度学习是机器学习的分支，也是当下最火热的领域。接下来我们通过一个例子，感受两种深度学习算法的魅力。

看一个识别车牌的例子

```matlab
edit TrainAStopSignDetectorExample.m
```

上例用到了级联探测器，这个探测器的特点就是需要正面的例子和反面的例子，详情阅读文档《Train a Cascade Object Detector》。

上述例子还可以用 R-CNN（region convolution neural network，区域卷积神经网络）实现，详情阅读文档《Object Detection Using Deep Learning》，这种方法的特点是不需要反面的例子，只需要正面的例子。

用深度学习的方法识别物体往往需要大量的标记好的数据，标记的过程是耗时耗力的。此外，训练神经网络需要大量的计算资源。这两点是限制深度学习普及的重要因素。比如说，DeepMind 公司训练 AlphaGo 系列产品，使用了数千块 TPU。

## 家庭作业

阅读文档《Coordinate Systems》《Object Detection in a Cluttered Scene Using Point Feature Matching》。

从 scene.jpg 的场景中检测 bag.jpg 中的塑料包装袋并定位。

阅读 [为什么有些验证码看起来很容易但是没人做自动识别的？](https://www.zhihu.com/question/35085930) 和 [怎样用 MATLAB 识别图片上的文字?](https://www.zhihu.com/question/30004296)。

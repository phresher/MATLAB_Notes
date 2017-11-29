# 特征提取和识别

## 目标

了解多种检测、提取特征的算法

了解匹配特征的算法

了解储存特征的函数

学会在复杂场景中寻找特定物体的方法

学会匹配两张图的特征点

## 内容

阅读文档《Local Feature Detection and Extraction》《Point Feature Types》《Local Feature Extraction》，了解 BRISK、 FAST、 Harris、 MinEigen、 MSERF、 SURF，这些函数可以检测不同类型的特征。

调用课程提供的函数 detectObjectDemo 在图片 scene.jpg 的场景中检测 cover.jpg 中的书。

```matlab
detectObjectDemo('cover.jpg', 'scene.jpg', 1);
```

## 家庭作业

阅读文档《Coordinate Systems》《Automatically Detect and Recognize Text in Natural Images》《Object Detection in a Cluttered Scene Using Point Feature Matching》

从 scene.jpg 的场景中检测 bag.jpg 中的塑料包装袋并定位。

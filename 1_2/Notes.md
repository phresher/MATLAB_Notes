# matlab 语言基础

## 目标

熟悉 matlab 编辑器

熟悉帮助文档的格式和用法

了解基本的数学运算、逻辑运算

了解循环、判断语句

了解常用的数据类型

了解函数的定义方式

了解输入输出数据的方法

编写一个判断闰年的程序

## 内容

### matlab 编辑器

熟悉快捷键，例如，tab 键补全，F5 运行，在使用过程中积累

试着誊写一段程序，以熟悉一些关键词和语法，例如

```matlab
t = 0:.001:.25;
x = sin(2*pi*50*t) + sin(2*pi*120*t);
y = x + 2*randn(size(t));

figure
plot(y(1:50))
title('Noisy time domain signal')
Y = fft(y,251);
Pyy = Y.*conj(Y)/251;
f = 1000/251*(0:127);

figure
plot(f,Pyy(1:128))
title('Power spectral density')
xlabel('Frequency (Hz)')
```
### 帮助文档的格式和用法

使用 doc 和 help 命令获取帮助，例如

```matlab
help title
```
### 基本的数学运算和逻辑运算

浏览帮助文档 Operators and Elementary Operations

注意矩阵运算中 .* 和 * 的区别，点的意思是“矩阵中的元素参与运算”

求解线性方程组

### 循环、判断语句

阅读帮助文档 Control Flow

### 常用的数据类型

各种整数，注意溢出

双精度浮点数，默认的数据类型

字符串

元胞数组

### 函数

阅读帮助文档 Functions，注意 Error Handling 一节

### 输入输出数据

在屏幕上显示 disp

接受键盘输入 input

格式化字符串 sprintf，类似 C 语言

各种读取、写入文件的函数，帮助文档 Data Import and Export

### 编写判断闰年的程序

编写一个函数，输入年份，判断这一年份是不是闰年，要求检查输入的年份是否合法，不合法要报错

使用这一函数统计从 1840 年到 2050 年共有多少个闰年，分别是那几年

### 家庭作业

阅读 MATLAB Examples 中的 Mathematics 和 Graphics

完成判断闰年的程序

完成冒泡排序、插入排序、选择排序和堆排序

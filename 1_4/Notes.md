# 在本地和云端管理数据和程序

## 目标

了解软件工程的习惯和基本思想

了解 git 和 GitHub

完成一个简单的爬虫程序

使用 git 上传课堂作业

## 内容

### 软件工程的习惯和基本思想

变量命名法则。首先，保证合法性，参见帮助文档 Variable Names。其次，变量形式要美观，含义要直白，推荐使用骆驼命名法，如 isLeapYear

分而治之的思路（自顶向下、自底向上）

使用函数以提高代码的重用性

程序和数据分离，建议将数据分门别类存在工作目录的不同文件夹中

遵守统一、公认的格式规范，更多内容参见 [MATLAB Programming Style Guidelines](http://www.datatool.com/downloads/matlab_style_guidelines.pdf)

使用版本控制工具（推荐 git）

### git 和 GitHub

登录 GitHub 以了解更多

matlab 和 git 可以非常好地交互，matlab 在图形界面中整合了git，阅读帮助文档 Source Control Integration 中有关 git 的部分

fork 并 clone 本课程在 GitHub 上的 repo

### 一个爬虫程序

根据期刊的 ISSN 查找它的影响因子。这些待查找的 ISSN 值记录在 homework/qinghua.xls 文件中。将查好的影响因子记录在这个表格的第三列。

在 homework 文件夹中新建一个脚本，在脚本中使用 searchImpactFactor.m 函数完成这个任务。

### 使用 git 上传课堂作业

将刚写好的脚本添加（add）到 git

提交（commit）修改

推送（push）到远程服务器

在 GitHub 上提交 pull request

### 家庭作业

阅读 MATLAB Programming Style Guidelines

完成课堂上提到的程序

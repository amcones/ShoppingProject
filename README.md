# ShoppingProject

<img width="1312" alt="截屏2022-11-23 21 02 24" src="https://user-images.githubusercontent.com/26200600/203991548-26dab434-33b3-43c3-a171-e8832d0a7f32.png">

## 简介

此项目是我大学Python课程的大作业，要求实现一个商品管理系统，带有桌面端。

使用了 Qt6、Pyside6、Sqlite、Python3.10.7 等进行开发，界面风格为扁平黑白系，带有少量动效。

<img width="1136" alt="截屏2022-11-23 21 02 16" src="https://user-images.githubusercontent.com/26200600/203991706-855bf977-f0bd-47d9-8cdb-5b8f4144e386.png">

开发环境基于Mac M1，不保证其它平台能够运行。

## 运行

需要确保python环境装有pyside6包。

```shell
pip install pyside6
```

## 贡献

由于时间问题，目前项目还有很多不完善的地方，如：
- [ ] 打开文件时主窗口应遮罩，防止生成多个窗口实例。
- [ ] 内存占用过大，未知窗口闪退问题（怀疑有内存泄漏）
- [ ] 动效较少，部分窗口简陋
- [ ] 实现方式简陋

欢迎提出issue来改进项目🎉

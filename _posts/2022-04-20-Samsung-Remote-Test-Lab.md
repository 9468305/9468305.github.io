---
layout: post
title: "Tech：三星远程测试实验室"
description: "Android Samsung Remote Test Lab RTL"
image: ../static/chenqi.jpg
author: ChenQi
category: [Technology, Android]
---

长期在家办公背景下，大前端研发人员必然遇到手头测试手机系统和型号不足，且无法在团队中调配置换的情况。虽然有安卓苹果模拟器，总归不如真机方便，且某些场景下必须在真机调试运行，例如CPU内存帧率等性能分析评测。所以再次简单科普三星远程测试实验室的最新功能。

### Remote Test Lab

<https://developer.samsung.com/remote-test-lab>  
<https://developer.samsung.com/remotetestlab/deviceList.action>  
RTL = Remote Test Lab = 远程测试实验室 = 远程控制/观看/实时交互/测试运行三星真实移动设备。

### 常规功能

+ 应用程序安装  
可以在适当的设备上安装和测试 Android 和 Tizen 应用程序。
+ 屏幕捕获和录制  
可以在测试期间随时捕获或录制屏幕。
+ 音频流  
可以收听通过测试设备播放的音频。
+ 多点触控手势支持
+ 日志
+ 重复自动化测试
可以记录一系列动作并多次重播该序列。
+ 远程调试桥(RDB Remote Debug Bridge)  
可以通过 Android Studio 等开发工具访问远程设备，就像设备连接到本地计算机一样。

### Auto Repeat

添加，录制，播放，暂停，手动创建测试序列，保存至XML文件供后续重复使用。

### Remote Debug Bridge

RDB将RTL设备与本地开发机器的ADB（Android 调试桥）连接起来，方便Android Studio配合部署调试。

### New Web-Based Client

新的基于 Web 的客户端不需要单独的安装文件，并且改进了启动功能。它直接在您的 Web 浏览器中提供与真实设备相当的用户体验。

### 多区域服务器节点

RTL在美国、英国、韩国等8个国家以及美洲、欧洲和亚洲其他国家设有10个服务中心。由于每个服务集线器都有不同的可用设备型号，因此如果需要，您还可以访问其他集线器上的设备。在所有服务中心，您可以连接到 1500 多种不同的设备，从移动设备（例如最新的可折叠型号）到最新的智能手表设备。利用远程测试实验室在各种规格和分辨率的 Galaxy 移动设备和手表设备上测试您的应用程序。

### References

+ [Get Started with Remote Test Lab for Mobile App Testing](https://developer.samsung.com/sdp/blog/en-us/2021/02/18/get-started-with-remote-test-lab-for-mobile-app-testing)
+ [What's New in Remote Test Lab](https://developer.samsung.com/sdp/blog/en-us/2021/03/17/whats-new-in-remote-test-lab)
+ [Remote Test Lab: Testing Your App with Auto Repeat](https://developer.samsung.com/sdp/blog/en-us/2021/04/15/remote-test-lab-testing-your-app-with-auto-repeat)
+ [Using Remote Test Lab with Android Studio](https://developer.samsung.com/sdp/blog/en-us/2021/06/04/using-remote-test-lab-with-android-studio)
+ [Test Your Apps in Multiple Regions with the New Web-Based Remote Test Lab](https://developer.samsung.com/remote-test-lab/blog/en-us/2021/11/09/test-your-apps-in-multiple-regions-with-the-new-web-based-remote-test-lab)

---
layout: post
title: "Tech：整理一波安卓ROM刷机资料"
description: "Android ROM Recovery Bootloader 一门几近失传的古老手艺"
image: ../static/chenqi.jpg
author: ChenQi
category: [Technology, Android]
---

安卓第三方ROM刷机行业已经几乎消失殆尽，用户懒得折腾，厂商渠道升级为主，手机平均2年一换。  
简单整理一波目前常规刷机升级资源网站。（给团队里那些懒人）

### 华为 EMUI

+ 花粉俱乐部 https://club.huawei.com/
+ （第三方）华粉圈 https://www.huaweirom.com/rom/
+ （第三方）http://huawei-firmware.com/

### 小米 MIUI

+ 中国版 https://www.miui.com/download.html
+ 国际版 https://c.mi.com/global/miuidownload/index
+ （第三方）MIUI历史版本 https://miuiver.com/
+ （第三方）MIUI ROM仓库 https://roms.miuier.com/

### OPPO ColorOS

+ 官网 https://www.coloros.com/rom

### VIVO

+ 官网 https://www.vivo.com/upgrade/index
+ 教程 https://www.vivo.com.cn/service/static/cloud-service#4

### 魅族 Flyme

+ 官网 https://www.flyme.com/firmware.html

### 三星（最复杂）

`仅支持 Windows 刷机`。  

Android USB Driver for Windows  
https://developer.samsung.com/mobile/android-usb-driver.html  

Odin刷机工具（例如 3.13.1 版本）  
https://samsungodin.com/  
https://odindownload.com/  

ROM下载  
https://samfrew.com/zh/  
https://www.sammobile.com/firmwares/  

#### 三星刷机流程

+ 安装三星手机驱动程序。  
+ 安装（解压）Odin刷机工具。  
+ 下载ROM固件压缩包，解压，获得 `*.tar.md5` 一个大文件。  
+ 重启手机进入“下载模式”。  
    方法：关机后，同时按住（音量下键 + 电源键 + Home键），直到启动“下载模式”（约5-8 秒）。  
+ 手机USB 连接 PC，打开Odin Tool。  
+ Odin Tool 刷机：
  + Option Tab 设置选项界面，选中“自动重启”(Auto Reboot) 和“刷机重置时间”(F. Reset Time) 选项。  
  + 点击 AP/PDA 按钮，选择已下载解压的 `*.tar.md5` 一个大文件。  
  + 点击 start（开始）按钮，开刷。  
  + 等待至完成。  

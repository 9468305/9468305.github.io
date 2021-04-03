---
layout: post
title: "Tech：fliggy app outline"
description: "android iOS"
image: ../static/chenqi.jpg
author: ChenQi
category: [Technology, Android]
---

## Android

<div class="scrollable-table-wrapper" markdown="block">

安装包 | 信息
:--|--:
时间 | 2021.04.01
版本 | V9.7.2.105
大小 | 102MB
包名 | com.taobao.trip

{:.table-scrollable}
</div>

通过ADB命令查找当前界面GUI堆栈信息。  
`adb shell dumpsys activity com.taobao.trip`  
使用 [JEB](https://www.pnfsoftware.com/) 反编译APK阅读代码。

以下未特殊说明的部分均为原生实现。

### 1. App首页

.home.HomeActivity

+ JimHomePageFragment

### 2. 酒店

酒店首页  
.hotel.home.HotelHomeActivity

酒店列表页  
.hotel.ui.HotelListActivityV2

+ HotelListFragmentV2
+ HotelListMapFragment

酒店房型页  
.hotel.detail.v5.HotelDetailActivityV5

+ HotelDetailFragmentV5

酒店购买填写页  
.fliggybuy.buynew.FliggyBuyNewActivity

我的订单  
.ultronbusiness.orderlist.FliggyOrderListActivity

### 3. 机票

机票首页  
.flight.ui.FlightHomeActivity

机票列表页  
.flight.ui.singlelist.FlightListActivity

机票舱位中间页  
.flight.ui.ota.otalist.FlightOtaListActivity

机票购买填写页  
（同酒店Activity壳，内部不同）  
.fliggybuy.buynew.FliggyBuyNewActivity

我的订单  
（同酒店Activity壳，内部相似，可能是同一个页面。）  
.ultronbusiness.orderlist.FliggyOrderListActivity

值机选座  
(H5 WebView 实现)  
.h5container.ui.ActWebviewActivity

+ ActWebviewFragment

航班动态 首页 + 列表页  
（Flutter实现）  
.flutter.TripFlutterActivity  

我的收藏  
（Weex实现）  
.weex.WeexActivity

+ TripWeexFragment

## iOS (by QIN)

整体技术栈与Android类似。

### 1. 酒店

原生实现 + 动态布局(远程加载)

关键字：DXContainerEngine  
文件扩展名 *.dx  
文件格式签名 ALIDX  

#### [Tangram](http://tangram.pingguohe.net/)

由天猫无线-基础业务团队主力维护的Android iOS原生动态界面开源项目。

> Tangram，七巧板，几块简单的积木就能拼出大千世界。我们用Tangram来命名这套界面方案，也是希望他能像七巧板一样可以通过几块积木就搭出丰富多彩的界面。

### 2. 机票

纯原生，未使用DX动态方案。

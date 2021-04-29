---
layout: post
title: "Tech：Android Jetpack DataStore Outline"
description: "androidx datastore preferences proto SharedPreferences"
image: ../static/chenqi.jpg
author: ChenQi
category: [Technology, Android, Kotlin]
---

官网指南：[DataStore](https://developer.android.google.cn/topic/libraries/architecture/datastore?hl=zh_cn)

官方博客：2020.09.02 [《Prefer Storing Data with Jetpack DataStore》](https://android-developers.googleblog.com/2020/09/prefer-storing-data-with-jetpack.html)

Codelabs：

+ [使用 Preferences DataStore](https://developer.android.google.cn/codelabs/android-preferences-datastore/index.lab?hl=zh_cn#0)
+ [使用 Proto DataStore](https://developer.android.google.cn/codelabs/android-proto-datastore/index.lab?hl=zh_cn#0)

源码仓库：

+ [AOSP](https://android.googlesource.com/platform/frameworks/support/+/refs/heads/androidx-main/datastore/)
+ [GitHub](https://github.com/androidx/androidx/tree/androidx-main/datastore)

项目模块：

```bash
.
├── datastore
├── datastore-core
├── datastore-preferences
├── datastore-preferences-core
├── datastore-preferences-rxjava2
├── datastore-preferences-rxjava3
├── datastore-proto
├── datastore-rxjava2
├── datastore-rxjava3
└── datastore-sampleapp
```
